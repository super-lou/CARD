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


#  ___                  __  _              
# | _ ) __ _  ___ ___  / _|| | ___ __ __ __
# | _ \/ _` |(_-</ -_)|  _|| |/ _ \\ V  V /
# |___/\__,_|/__/\___||_|  |_|\___/ \_/\_/ ___________________________
#' @title approxExtrap
#' @description Performs linear interpolation using `approx()` with linear extrapolation beyond the data range.
#' This function is particularly useful when you need to estimate values outside the range of
#' your observed data points.
#'
#' @param x Either a vector of x-coordinates of points to be interpolated, or a list with
#'           components `x` and `y`. If a list is provided, the `y` parameter is ignored.
#' @param y Vector of y-coordinates of points to be interpolated, corresponding to `x`.
#' @param xout Vector of points at which to evaluate the interpolation/extrapolation.
#' @param method Specifies the interpolation method. Only "linear" is currently supported.
#'               The default is "linear".
#' @param n If `xout` is not specified, interpolation is done at `n` equally spaced points
#'          covering the range of `x`. The default is 50.
#' @param rule An integer (1 or 2) describing how interpolation is to take place outside
#'             the interval [min(x), max(x)]. See `approx()` for details. The default is 2.
#' @param f For `method = "constant"`, a number between 0 and 1 inclusive, indicating how
#'          interpolation should behave at jump discontinuities. See `approx()` for details.
#'          The default is 0.
#' @param ties Handling of tied `x` values. See `approx()` for details. The default is "ordered".
#' @param na.rm Logical indicating whether NA values should be removed before interpolation.
#'              The default is FALSE.
#'
#' @return A list with components:
#'   \item{x}{The x-coordinates where interpolation was performed (same as input `xout`)}
#'   \item{y}{The interpolated/extrapolated y-values corresponding to `xout`}
#'
#' @details
#' The function first performs standard linear interpolation using `approx()`. For points
#' outside the range of the input data, it performs linear extrapolation using the slope
#' defined by the first two points (for low extrapolation) or last two points (for high
#' extrapolation).
#'
#' The function handles duplicate x-values by removing them and orders the data by x-values
#' to ensure proper interpolation and extrapolation.
#'
#' @seealso
#' \code{\link[stats]{approx}} for the base interpolation function.
#'
#' @examples
#' # Basic interpolation and extrapolation
#' x <- 1:5
#' y <- c(2, 4, 3, 6, 5)
#' approxExtrap(x, y, xout = c(0, 1, 3.5, 5, 6))
#'
#' # With NA values (when na.rm = TRUE)
#' x <- c(1, 2, NA, 4, 5)
#' y <- c(2, 4, 5, 6, 5)
#' approxExtrap(x, y, xout = 1:6, na.rm = TRUE)
#'
#' @export
#' @md
approxExtrap = function(x, y, xout, method='linear', n=50, rule=2,
                        f=0, ties='ordered', na.rm=FALSE) {	
    ## Linear interpolation using approx, with linear extrapolation
    ## beyond the data
    if (is.list(x)) {
        y = x[[2]]
        x = x[[1]]
    }
    ## remove duplicates and order so can do linear extrapolation
    if (na.rm) {
        d = ! is.na(x + y)
        x = x[d]
        y = y[d]
    }
    x = as.numeric(x)  # handles dates etc.
    y = as.numeric(y)
    d = ! duplicated(x)
    x = x[d]
    y = y[d]
    d = order(x)
    x = x[d]
    y = y[d]    
    w = approx(x, y, xout=xout, method=method, n=n,
               rule=2, f=f, ties=ties)$y    
    r = range(x)
    d = xout < r[1]
    if (any(is.na(d))) {
        stop('NAs not allowed in xout')
    }
    if (any(d)) {
        w[d] = (y[2]-y[1])/(x[2]-x[1])*(xout[d]-x[1])+y[1]
    }    
    d = xout > r[2]
    n = length(y)
    if (any(d)) {
        w[d] = (y[n]-y[n-1])/(x[n]-x[n-1])*(xout[d]-x[n-1])+y[n-1]
    }
    return (list(x=xout, y=w))
}


## 1. BASEFLOW SEPARATION ____________________________________________
#' @title BFS - Baseflow Separation
#' @description Performs baseflow separation from streamflow data using either the Wallingford 
#' method or the Lyne & Hollick digital filter approach. The Wallingford method identifies 
#' turning points in the hydrograph, while the Lyne & Hollick method applies a recursive 
#' digital filter.
#'
#' @param Q Numeric vector of discharge (streamflow) values. Missing values (NA) are allowed.
#' @param d Integer specifying the window size (in days) for identifying minima in the Wallingford 
#' method. Default is 5.
#' @param w Numeric weighting factor (0-1) used in the Wallingford method to identify turning 
#' points. Default is 0.9.
#' @param a Numeric filter parameter (0-1) for the Lyne & Hollick method, where higher values 
#' result in smoother baseflow. Default is 0.925.
#' @param passes Integer specifying the number of forward/backward passes for the Lyne & Hollick 
#' method. Default is 3 (recommended for optimal results).
#' @param method Character specifying the separation method: "Wal" for Wallingford or "LH" for 
#' Lyne & Hollick. Default is "Wal".
#'
#' @return A numeric vector of baseflow values corresponding to the input discharge values. 
#' Returns NA if the input contains only NA values or if insufficient turning points are found 
#' (Wallingford method).
#'
#' @details
#' For the Wallingford method (`method = "Wal"`):
#' \itemize{
#'   \item The hydrograph is divided into `d`-day segments
#'   \item The minimum flow in each segment is identified
#'   \item Turning points are identified where w*Qmin < adjacent minima
#'   \item Baseflow is interpolated between these turning points
#' }
#'
#' For the Lyne & Hollick method (`method = "LH"`):
#' \itemize{
#'   \item Applies a recursive digital filter with parameter `a`
#'   \item Performs multiple forward/backward passes (specified by `passes`)
#'   \item The filter equation is: SF[i] = a*SF[i-1] + (1+a)/2 * (Q[i]-Q[i-1])
#' }
#'
#' @references
#' Gustard, A., Bullock, A., & Dixon, J. M. (1992). Low Flow Estimation in the United Kingdom. 
#' Institute of Hydrology Report No. 108. Wallingford, UK.
#'
#' Lyne, V., & Hollick, M. (1979). Stochastic time-variable rainfall-runoff modelling. 
#' Institute of Engineers Australia National Conference, 89-93.
#'
#' @examples
#' # Load sample streamflow data
#' Q <- c(10, 12, 15, 20, 18, 16, 14, 12, 10, 9)  # Streamflow
#'
#' # Apply Wallingford method
#' baseflow_wal <- BFS(Q, method = "Wal")
#'
#' # Apply Lyne & Hollick method with custom parameters
#' baseflow_lh <- BFS(Q, method = "LH", a = 0.95, passes = 5)
#'
#' # Plot results
#' plot(Q, type = "l")
#' lines(baseflow_wal, col = "blue")
#' lines(baseflow_lh, col = "red")
#'
#' @seealso \code{\link{approxExtrap}} for the interpolation function used in the Wallingford method.
#' @export
#' @md
BFS = function (Q, d=5, w=0.9, a=0.925, passes=3, method='Wal') {

    if (method == "Wal") {
        N = length(Q)
        if (all(is.na(Q))) {
            return (NA)
        }
        Slices = split(Q, ceiling(seq_along(Q)/d))    
        idMinSlices = unlist(lapply(Slices, which.minNA),
                             use.names=FALSE)
        
        idShift = c(0, cumsum(unlist(lapply(Slices, length),
                                     use.names=FALSE)))
        idShift = idShift[-length(idShift)]
        idMin = idMinSlices + idShift
        Qmin_k = Q[idMin]

        if (length(Qmin_k) == 1) {
            BF = rep(NA, N)
            return (BF)
        }

        n = length(Qmin_k)
        Qmin_kp1 = c(Qmin_k[2:n], NA)
        Qmin_km1 = c(NA, Qmin_k[1:(n-1)])
        test = w * Qmin_k < pmin(Qmin_km1, Qmin_kp1)
        test[is.na(test)] = FALSE
        idPivots = idMin[which(test)]
        Pivots = Qmin_k[test]

        nbNAid = length(idPivots[!is.na(idPivots)])
        nbNA = length(Pivots[!is.na(Pivots)])
        if (nbNAid >= 2 & nbNA >= 2) {
            BF = approxExtrap(idPivots, Pivots, xout=1:N,
                              method="linear", na.rm=TRUE)$y  
            BF[is.na(Q)] = NA
            BF[BF < 0] = 0
            test = BF > Q
            test[is.na(test)] = FALSE
            BF[test] = Q[test]
            
        } else {
            BF = rep(NA, N)
        }
        
    } else if (method == "LH") {
        
        BF_LH_hide = function (SFim1, i, Q) {
            if (!is.na(Q[i]) & !is.na(Q[i-1])) {
                SFi = a*SFim1 + (1+a)/2 * (Q[i]-Q[i-1])
            } else {
                SFi = 0
            }
            return (SFi)
        }
        
        n = length(Q)
        Qtmp = Q
        
        for (p in 1:passes) {
            if (p %% 2 == 0) {
                Qtmp = rev(Qtmp)
            }
            SF = purrr::accumulate(2:n,
                                   .f=BF_LH_hide,
                                   Q=Qtmp, .init=0)
            SF[SF < 0] = 0
            Qtmp = Qtmp - SF
            if (p %% 2 == 0) {
                Qtmp = rev(Qtmp)
            }
        }
        BF = Qtmp
    }
    return (BF)
}

#' @title dBFS
#' @description Calculates the difference between total streamflow and baseflow (Q - baseflow) 
#' using \code{\link{BFS}}. This typically represents quickflow (surface runoff + interflow), 
#' but interpretation depends on the baseflow separation method used.
#'
#' @inheritParams BFS
#' 
#' @return A numeric vector of (Q - baseflow) values. The interpretation depends on the method:
#' \itemize{
#'   \item For `method = "Wal"`: Represents quickflow (surface runoff + interflow)
#'   \item For `method = "LH"`: Represents filtered quickflow component
#' }
#' Returns NA if the input contains only NA values.
#'
#' @details This function computes the difference between total streamflow (Q) and baseflow 
#' as estimated by \code{\link{BFS}}:
#' \deqn{quickflow = Q - BFS(Q, ...)}
#' 
#' Note that:
#' \itemize{
#'   \item The result is NOT direct runoff in the hydrological sense
#'   \item The components depend on the separation method's assumptions
#'   \item Negative values are possible due to separation artifacts
#' }
#'
#' @seealso \code{\link{BFS}} for the baseflow separation function and its parameter documentation.
#'
#' @examples
#' # Calculate quickflow component using Wallingford method
#' Q <- c(10, 12, 15, 20, 18, 16, 14, 12, 10, 9)
#' quickflow <- dBFS(Q, method = "Wal")
#'
#' @export
#' @md
dBFS = function (Q, d=5, w=0.9, a=0.925, passes=3, method='Wal') {
    BF = BFS(Q, d=d, w=w, a=a, passes=passes, method=method)
    dBF = Q - BF
    return (dBF)
}


## 2. BASEFLOW INDEX _________________________________________________
#' @title Compute Baseflow Index
#' @description Calculates the Baseflow Index (BFI), defined as the ratio of total baseflow 
#' volume to total streamflow volume over a given period. The BFI represents the proportion 
#' of streamflow that comes from baseflow (groundwater contributions).
#'
#' @param Q Numeric vector of streamflow/discharge values [L³/T]
#' @param BF Numeric vector of baseflow values [L³/T], typically obtained from a 
#'           baseflow separation method (must be same length as Q)
#' @param na.rm Logical indicating whether to ignore missing values (NA) in the calculations. 
#'              Default is TRUE.
#'
#' @return A numeric value between 0 and 1 representing the baseflow index:
#' \itemize{
#'   \item 0 indicates all streamflow is quickflow (surface runoff)
#'   \item 1 indicates all streamflow is baseflow
#' }
#' 
#' @details 
#' The Baseflow Index is calculated as:
#' \deqn{BFI = \frac{\sum BF}{\sum Q}}
#' 
#' \strong{Important notes:}
#' \itemize{
#'   \item The function assumes both vectors cover the same time period
#'   \item No automatic alignment of time series is performed
#'   \item Negative values in either vector will produce invalid results
#'   \item Results are only meaningful when using consistent units for Q and BF
#' }
#'
#' @examples
#' # Example using synthetic data
#' Q <- c(10, 12, 15, 20, 18, 16, 14, 12, 10, 9)  # Streamflow
#' BF <- c(8, 8, 9, 9, 9, 8, 8, 8, 7, 7)          # Baseflow
#' 
#' # Calculate BFI
#' bfi <- get_BFI(Q, BF)
#' print(paste("Baseflow Index:", round(bfi, 3)))
#'
#' # With missing values
#' Q[3] <- NA
#' get_BFI(Q, BF)               # Returns NA
#' get_BFI(Q, BF, na.rm=TRUE)   # Ignores NA
#'
#' @seealso \code{\link{BFS}} for baseflow separation methods that can generate the BF input.
#' @export
#' @md 
get_BFI = function (Q, BF, na.rm=TRUE) {
    if (length(Q) != length(BF)) {
        warning("'Q' and 'BF' don't have the same length!")
    }
    res = sum(BF, na.rm=na.rm) / sum(Q, na.rm=na.rm)
    return (res)
} 


## 3. BASEFLOW MAGNITUDE _____________________________________________
#' @title Baseflow Magnitude
#' @description Calculates the relative difference between maximum and minimum values in a 
#' baseflow time series, representing the seasonal variability of baseflow contributions.
#'
#' @param BFA Numeric vector of inter-annual daily average of baseflow values [L³/T]
#'
#' @return A numeric value between 0 and 1 representing baseflow variability:
#' \itemize{
#'   \item 0 indicates no seasonal variability (constant baseflow)
#'   \item 1 indicates extreme variability (minimum baseflow approaches zero)
#' }
#'
#' @details 
#' The Baseflow Regime Magnitude is calculated as:
#' \deqn{BFM = \frac{BFA_{max} - BFA_{min}}{BFA_{max}}}
#' 
#' Where:
#' \itemize{
#'   \item \eqn{BFA_{max}} is the maximum baseflow in the series
#'   \item \eqn{BFA_{min}} is the minimum baseflow in the series
#' }
#'
#' \strong{Key characteristics:}
#' \itemize{
#'   \item Returns a value between 0 (no variability) and 1 (maximum variability)
#'   \item Handles missing values (NA) automatically
#'   \item No smoothing is applied to the input series
#'   \item Particularly useful for comparing seasonal baseflow patterns between catchments
#' }
#'
#' @examples
#' # Example with synthetic baseflow data (annual cycle)
#' baseflow <- c(rep(5,90), rep(8,90), rep(12,90), rep(7,95)) # Seasonal pattern
#' result <- get_BFM(baseflow)
#' 
#' print(paste("Baseflow variability:", round(result$magnitude, 2)))
#' print(paste("Maximum baseflow:", round(result$max, 2)))
#' print(paste("Minimum baseflow:", round(result$min, 2)))
#'
#' # Example with real data (would need actual baseflow series)
#' # data(streamflow)
#' # bf <- BFS(streamflow$Q, method="LH")
#' # get_BFM(bf)
#'
#' @seealso \code{\link{BFS}} for baseflow separation methods that can generate baseflow inputs.
#' @export
#' @md
get_BFM = function (BFA) {
    BFA_max = max(BFA, na.rm=TRUE)
    BFA_min = min(BFA, na.rm=TRUE)
    BFM = (BFA_max - BFA_min) / BFA_max
    return (BFM)
}


## 4. USE ____________________________________________________________
### 4.1. Volumic _____________________________________________________
#' @title Compute Total Snowmelt Volume
#' @description Calculates the total snowmelt volume (in hm³) from baseflow separation,
#' assuming baseflow represents snowmelt contributions to streamflow.
#'
#' @inheritParams compute_VolSnowmelt
#'
#' @return Numeric value of total snowmelt volume in cubic hectometers (hm³).
#'
#' @details 
#' Computes:
#' \deqn{VolSnowmelt = \frac{\sum BF \times 86400}{10^6}}
#' Where:
#' \itemize{
#'   \item BF is baseflow from \code{\link{BFS}}
#'   \item 86400 converts seconds to days
#'   \item 10^6 converts m³ to hm³
#' }
#'
#' @examples
#' Q <- c(10,15,20,18,12,8,5,7,9,12) # Sample streamflow (m³/s)
#' compute_VolSnowmelt(Q) # Returns volume in hm³
#'
#' @seealso \code{\link{BFS}} for baseflow separation method
#' @export
#' @md
compute_VolSnowmelt = function (Q, d=5, w=0.9, a=0.925, passes=3,
                                method='Wal') {
    BF = BFS(Q, d=d, w=w, a=a, passes=passes, method=method)
    VolSnowmelt = sum(BF, na.rm=TRUE)*24*3600 / 10^6 # m^3.s-1 * jour / 10^6 -> hm^3
    return (VolSnowmelt)
}

### 4.2. Temporal_____________________________________________________
#' @title Compute Snowmelt Progress Time
#' @description Finds the time index when a certain percentage of total snowmelt volume
#' has been reached.
#'
#' @param p Numeric (0-1) specifying target progress percentage
#' @inheritParams compute_VolSnowmelt
#'
#' @return Integer index when cumulative snowmelt reaches p% of total volume.
#'
#' @details 
#' Computes:
#' \enumerate{
#'   \item Cumulative sum of baseflow (snowmelt)
#'   \item Normalizes to 0-1 range
#'   \item Finds closest time index to target percentage p
#' }
#'
#' @examples
#' Q <- c(10,15,20,18,12,8,5,7,9,12)
#' # Find when 50% of snowmelt has occurred:
#' compute_tVolSnowmelt(Q, p=0.5) 
#'
#' @seealso \code{\link{compute_VolSnowmelt}} for total volume calculation
#' @export
#' @md
compute_tVolSnowmelt = function (Q, p, d=5, w=0.9, a=0.925, passes=3,
                                 method='Wal') {
    BF = BFS(Q, d=d, w=w, a=a, passes=passes, method=method)
    VolSnowmelt = cumsum(BF)
    pVolSnowmelt = VolSnowmelt / maxNA(VolSnowmelt, na.rm=TRUE)
    idp = which.minNA(abs(pVolSnowmelt - p))
    return (idp)
}

### 4.3. Duration ____________________________________________________
#' @title Compute Snowmelt Period Duration
#' @description Calculates the duration between two percentage points of snowmelt progression.
#'
#' @param p1,p2 Numerics (0-1) specifying start and end percentages
#' @inheritParams compute_VolSnowmelt
#'
#' @return Integer duration (in time steps) between p1 and p2 snowmelt percentages.
#'
#' @details 
#' Typical usage:
#' \itemize{
#'   \item p1=0.05 (start of melt period)
#'   \item p2=0.95 (end of melt period)
#'   \item Returns number of days between these events
#' }
#'
#' @examples
#' Q <- c(rep(5,30), seq(5,25,length.out=30), rep(25,30), seq(25,5,length.out=30))
#' # Calculate duration between 10% and 90% snowmelt:
#' compute_tSnowmelt(Q, p1=0.1, p2=0.9)
#'
#' @seealso \code{\link{compute_tVolSnowmelt}} for single timing calculation
#' @export
#' @md
compute_tSnowmelt = function (Q, p1, p2, d=5, w=0.9, a=0.925,
                              passes=3, method='Wal') {
    BF = BFS(Q, d=d, w=w, a=a, passes=passes, method=method)
    VolSnowmelt = cumsum(BF)
    pVolSnowmelt = VolSnowmelt / maxNA(VolSnowmelt, na.rm=TRUE)
    idp1 = which.minNA(abs(pVolSnowmelt - p1))
    idp2 = which.minNA(abs(pVolSnowmelt - p2))
    len = idp2 - idp1 + 1
    return (len)
}
