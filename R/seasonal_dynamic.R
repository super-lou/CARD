# Copyright 2020      Ivan, Horner <ivan.horner@irstea.fr>*1,
#           2022-2025 Louis, Héraut <louis.heraut@inrae.fr>*2
#
# *1 IRSTEA, France
# *2 INRAE, UR RiverLy, Villeurbanne, France
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


#  ___                                  _ 
# / __| ___  __ _  ___ ___  _ _   __ _ | |
# \__ \/ -_)/ _` |(_-</ _ \| ' \ / _` || |
# |___/\___|\__,_|/__/\___/|_||_|\__,_||_|
#     _                           _     
#  __| | _  _  _ _   __ _  _ __  (_) __ 
# / _` || || || ' \ / _` || '  \ | |/ _|
# \__,_| \_, ||_||_|\__,_||_|_|_||_|\__| _____________________________
#        |__/  
## 1. RUNOFF COEFFICIENT _____________________________________________
#' @title Compute Runoff Coefficient
#' @description Calculates the runoff coefficient (Rc) as the ratio of total streamflow volume 
#' to total precipitation volume over a specified period, typically a hydrological year.
#'
#' @param Q Numeric vector of streamflow/discharge values [L³/T]
#' @param R Numeric vector of precipitation values [L/T]
#' @param na.rm Logical indicating whether to ignore missing values (NA) in calculations. 
#'              Default is TRUE.
#'
#' @return A numeric value representing the runoff coefficient (dimensionless):
#' \itemize{
#'   \item 0 indicates no runoff
#'   \item 1 indicates all precipitation becomes runoff
#'   \item Values >1 suggest groundwater contributions or measurement errors
#' }
#'
#' @details 
#' The runoff coefficient is calculated as:
#' \deqn{Rc = \frac{\sum Q}{\sum R}}
#' 
#' \strong{Important notes:}
#' \itemize{
#'   \item Input vectors must cover the same time period
#'   \item Should be computed for complete hydrological years
#'   \item No unit conversion is performed - ensure consistent units
#'   \item Negative values will produce invalid results
#' }
#'
#' @examples
#' # Example for a hydrological year
#' Q <- c(10, 12, 15, 20, 18, 16, 14, 12, 10, 9, 8, 7)  # Streamflow (mm/month)
#' P <- c(20, 25, 30, 35, 40, 45, 40, 35, 30, 25, 20, 15) # Precipitation (mm/month)
#' 
#' rc <- compute_Rc(Q, P)
#' print(paste("Runoff coefficient:", round(rc, 3)))
#'
#' @export
#' @md
compute_Rc = function(Q, R, na.rm=TRUE) {
    if (length(Q) != length(R)) {
        warning("'Q' and 'R' don't have the same length!")
    }
    res = sum(Q, na.rm=na.rm) / sum(R, na.rm=na.rm)
    return (res)
}


## 2 RQ SLOPE ________________________________________________________
#' @title Enhanced Cumulative Sum Calculation
#' @description Computes cumulative sums with options for handling missing values (NA), 
#' including linear interpolation between existing values.
#'
#' @param x Numeric vector for which to compute cumulative sums
#' @param na.action Character or numeric specifying NA handling:
#' \itemize{
#'   \item "interpolate": Linearly interpolates missing values (default)
#'   \item numeric value: Replaces NAs with specified value
#'   \item any other value: Uses base cumsum() with NAs propagating
#' }
#'
#' @return Numeric vector of cumulative sums with same length as x:
#' \itemize{
#'   \item NAs at start/end remain after warning
#'   \item Interpolated values for internal NAs when na.action="interpolate"
#' }
#'
#' @details 
#' For na.action="interpolate":
#' \itemize{
#'   \item Uses linear interpolation via stats::approx()
#'   \item Leading/trailing NAs are set to 0 with warning
#'   \item Returns NA for positions where input was NA
#' }
#'
#' @examples
#' x <- c(1, 2, NA, 4, 5, NA, 7)
#' 
#' # With interpolation
#' hsaCumsum(x) 
#' 
#' # With NA replacement
#' hsaCumsum(x, na.action=0)
#'
#' @seealso \code{\link[stats]{approx}} for interpolation method
#' @export
#' @md
hsaCumsum = function(x, na.action = "interpolate") {
    isna = is.na(x)
    if (all(isna)) stop("'x' cannot be only missing values!")
    if (any(isna)) {
        if (na.action == "interpolate") {
            y = 1:length(x)
            x[isna] = approx(x = y[!isna], y = x[!isna], xout = y[isna], method = "linear")$y
        } else if (is.numeric(na.action)) {
            x[isna] = na.action
        }
        isna = is.na(x)
        if (any(isna)) {
            warning("'x' has missing values at the start/end! They were treated as zeros.")
            x[isna] = 0
            y = cumsum(x)
            y[isna] = NA
            return(y)
        }
    }
    cumsum(x)
}

#' @title Compute R-Q Seasonal Slopes
#' @description Analyzes seasonal response changes using cumulative precipitation-runoff (R-Q) 
#' differences, identifying breakpoints between dry and wet periods.
#'
#' @param Q Numeric vector of streamflow values [L³/T]
#' @param R Numeric vector of precipitation values [L/T]
#' @param hdays Numeric vector of hydrological day indices (1-365/366)
#' @param start Integer first day to analyze (default: 15)
#' @param end Integer last day to analyze (default: 183)
#' @param bp Initial guess for breakpoint day (default: midpoint between start/end)
#' @param intercept Logical indicating whether to estimate intercepts (TRUE) or fix at 0 (FALSE)
#'
#' @return Named numeric vector containing:
#' \itemize{
#'   \item bp: Breakpoint day
#'   \item bp_strength: Magnitude of slope change
#'   \item slp_dry: Dry period slope
#'   \item b_dry: Dry period intercept
#'   \item slp_wet: Wet period slope
#'   \item b_wet: Wet period intercept
#' }
rq_slopes = function(Q, R, hdays, start=15, end=183, bp=mean(c(start, end)), intercept=TRUE) {
    RQ = data.frame(Q, R, hdays) %>% 
        group_by(hdays) %>%
        summarise_all(mean, na.rm = TRUE) %>%
        mutate_at(vars(Q, R), hsaCumsum) %>%
        mutate(R_Q = R - Q)
    RQ = RQ$R_Q
    x = start:end
    y = RQ[x]
    if (intercept) {
        reg = segmented(lm(y ~ x), psi = bp)
        coefs = reg$coefficients
    } else {
        reg = segmented(lm(y ~ x + 0), psi = bp)
        coefs = c(0, reg$coefficients)
    }
    coefs[3L] = sum(coefs[2:3])
    bp = reg$psi[, 2L]
    
    out = c(bp, 1 - coefs[3L] / coefs[2L], coefs[2L], coefs[1L], coefs[3L], coefs[2L] * bp + coefs[1L] - coefs[3L] * bp)
    names(out) = c("bp", "bp_strength", "slp_dry", "b_dry", "slp_wet", "b_wet")
    out
}
