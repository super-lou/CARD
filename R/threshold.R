# Copyright 2022-2025 Louis, Héraut <louis.heraut@inrae.fr>*1
#
# *1 INRAE, UR RiverLy, Villeurbanne, France
#
# This file is part of CARD R package.
#
# CARD R package is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version.
#
# CARD R package is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with CARD R package.
# If not, see <https://www.gnu.org/licenses/>.


#  _____  _                   _          _     _ 
# |_   _|| |_   _ _  ___  ___| |_   ___ | | __| |
#   | |  | ' \ | '_|/ -_)(_-<| ' \ / _ \| |/ _` |
#   |_|  |_||_||_|  \___|/__/|_||_|\___/|_|\__,_| ____________________
## 1. THRESHOLD __________________________________________________________  
#' @title Apply Threshold to Identify Events
#' @description Identifies and extracts events in a time series based on threshold criteria, 
#' with options for event selection and characterization.
#'
#' @param X Numeric vector of values to analyze (typically discharge or other hydro-meteorological variable)
#' @param lim Numeric threshold value or vector of same length as X
#' @param where String specifying threshold condition:
#' \itemize{
#'   \item "<", "<=", "==", ">=", ">" for standard comparisons
#' }
#' @param what String specifying return type:
#' \itemize{
#'   \item "X": Values meeting condition
#'   \item "length": Duration of events (time steps)
#'   \item "first"/"last": First/last index of events
#'   \item Any function name (e.g., "which.max"): Applied to event values
#' }
#' @param select String or numeric specifying event selection:
#' \itemize{
#'   \item "all": All events (default)
#'   \item "longest"/"shortest": Longest/shortest event
#'   \item Numeric value: Event containing this value
#' }
#' @param Date Optional date vector for period filtering
#' @param period Optional vector of 2 dates (start/end) for period filtering
#'
#' @return Depends on `what` parameter:
#' \itemize{
#'   \item Numeric vector of values ("X")
#'   \item Integer duration ("length")
#'   \item Single index ("first"/"last")
#'   \item Function application result
#'   \item NA if no events found
#' }
#'
#' @details 
#' Handles multiple threshold scenarios:
#' \itemize{
#'   \item For vector `lim`, uses most frequent value via `rle()`
#'   \item For period filtering, subsets data before analysis
#'   \item For event selection, identifies contiguous periods
#' }
#'
#' @examples
#' set.seed(1)
#' Q <- rnorm(100, 50, 10) # Simulated discharge
#' 
#' # Get longest drought period (Q <= 45)
#' drought_days <- apply_threshold(Q, 45, where="<=", what="length", select="longest")
#' 
#' # Get first index of all flood events (Q >= 60)
#' flood_starts <- apply_threshold(Q, 60, where=">=", what="first")
#'
#' @export
#' @md
apply_threshold = function (X, lim, where="<=", what="X",
                            select="all", Date=NULL, period=NULL) {


    if (all(is.na(lim))) {
        return (NA)
    }

    if (!is.null(Date) & !is.null(period)) {
        ok = period[1] <= Date & Date <= period[2]
        X = X[ok]
    }
    
    limRLE = rle(lim[!is.na(lim)])
    lim = limRLE$values[which.max(limRLE$lengths)]
    
    if (where %in% c("<", "<=", "==", ">=", ">")) {
        ID = which(get(where)(X, lim))
    # if (where == "under") {
        # ID = which(X <= lim)
    # } else if (where == "above") {
        # ID = which(X >= lim)
    } else {
        stop ("Choose 'under' or 'above'")
    }

    if (is.numeric(select)) {
        selectRLE = rle(select[!is.na(select)])
        select = selectRLE$values[which.max(selectRLE$lengths)]
        if (is.na(select)) {
            return (NA)
        }
    }

    if (is.numeric(select) | select == "longest" | select == "shortest") {
        dID = diff(ID)
        dID = c(10, dID)
        
        IDjump = which(dID != 1)
        Njump = length(IDjump)
        
        Periods = vector(mode='list', length=Njump)
        XPeriods = vector(mode='list', length=Njump)
        Nperiod = c()
        
        for (i in 1:Njump) {
            idStart = IDjump[i]
            
            if (i < Njump) {
                idEnd = IDjump[i+1] - 1
            } else {
                idEnd = length(ID)
            }
            
            period = ID[idStart:idEnd]
            Periods[[i]] = period
            Nperiod = c(Nperiod, length(period))

            if (is.numeric(select)) {
                if (select %in% X[period]) {
                    period_select = period
                    break
                }
            }
        }
        
        if (select == "longest") {
            period_select = Periods[[which.max(Nperiod)]]

        } else if (select == "shortest") {
            period_select = Periods[[which.min(Nperiod)]]
        }

        if (!exists("period_select")) {
            return (NA)
        }

        if (what == "X") {
            res = X[period_select]
        } else if (what == "length") {
            # res = period_select[length(period_select)] -
            #     period_select[1] + 1
            res = length(period_select)
            if (res == 0) {
                res = NA
            }
        } else if (what == "last") {
            res = period_select[length(period_select)]
        } else if (what == "first") {
            res = period_select[1]
        } else {
            res = period_select[1] + get(what)(X[period_select]) - 1
        }
        
    } else if (select == "all") {
        if (what == "X") {
            res = X[ID]            
        } else if (what == "length") {
            # res = ID[length(ID)] - ID[1] + 1
            res = length(ID)
            if (res == 0) {
                res = NA
            }
        } else if (what == "last") {
            res = ID[length(ID)]
        } else if (what == "first") {
            res = ID[1]
        } else {
            res = ID[1] + get(what)(X[ID]) - 1
        }
    }
    return (res)
}

# set.seed(1)
# X = rnorm(100, 0, 1)
# apply_threshold(X, 0, where=">=", what="length", select="longest")


## 2. USE ____________________________________________________________
#' @title Compute Volume Deficit Below Threshold
#' @description Calculates the cumulative volume deficit below a specified threshold 
#' for the longest continuous deficit period.
#'
#' @param Q Numeric vector of streamflow values [m³/s]
#' @param upLim Numeric upper threshold for deficit calculation
#' @param select_longest Logical indicating whether to use only the longest deficit 
#'        period (TRUE) or all periods (FALSE). Currently only TRUE is implemented.
#'
#' @return Numeric value of volume deficit in cubic hectometers (hm³)
#'
#' @details 
#' Computes:
#' \deqn{VolDef = \frac{\sum (Q_{deficit}) \times 86400}{10^6}}
#' Where:
#' \itemize{
#'   \item $Q_{deficit}$ are flows below threshold from longest event
#'   \item 86400 converts seconds to days
#'   \item 10^6 converts m³ to hm³
#' }
#'
#' @examples
#' Q <- c(45, 42, 39, 38, 40, 50, 48, 37, 36, 35, 40)
#' # Calculate volume deficit below 40 m³/s
#' vol_def <- compute_VolDef(Q, upLim=40)
#' print(paste("Volume deficit:", round(vol_def, 2), "hm³"))
#'
#' @seealso \code{\link{apply_threshold}} for the underlying event identification
#' @export
#' @md
compute_VolDef = function (Q, upLim, select_longest=TRUE) {
    Qdef = apply_threshold(Q,
                           lim=upLim,
                           where="<=",
                           what="X",
                           select="longest")
    Vol = sum(Qdef, na.rm=TRUE)*24*3600 / 10^6 # m^3.s-1 * jour / 10^6 -> hm^3
    return (Vol)
}
