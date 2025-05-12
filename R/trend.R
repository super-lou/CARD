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


#  _____                     _ 
# |_   _| _ _  ___  _ _   __| |
#   | |  | '_|/ -_)| ' \ / _` |
#   |_|  |_|  \___||_||_|\__,_| ______________________________________
## 1. MANN-KENDALL TREND TEST ________________________________________
## 1.1. Alpha ________________________________________________________
#' @title Get Sen-Theil Slope Estimate
#' @description Calculates the Sen-Theil estimator (α) of trend magnitude from the 
#' Generalized Mann-Kendall test, representing the median slope between all pairs of points.
#'
#' @param X Numeric vector of values to analyze
#' @inheritParams EXstat::GeneralMannKendall
#'
#' @return Numeric value representing the Sen-Theil slope estimate (α) in [units of X]/time.
#' \itemize{
#'   \item Positive value indicates increasing trend
#'   \item Negative value indicates decreasing trend
#'   \item Zero indicates no trend
#' }
#'
#' @details 
#' The Sen-Theil estimator:
#' \itemize{
#'   \item Non-parametric median of all pairwise slopes: \eqn{\alpha = median\left(\frac{X_j - X_i}{j-i}\right)} for all i < j
#'   \item Robust to outliers and missing values
#'   \item Measures trend magnitude in original units/time
#' }
#'
#' @examples
#' data(streamflow)
#' # Get trend slope in m³/s per time unit
#' trend_slope <- get_MKalpha(streamflow$Q)
#' print(paste("Trend slope:", round(trend_slope, 4), "m³/s per time unit"))
#'
#' @seealso \code{\link[EXstat]{GeneralMannKendall}} for the full test implementation
#' @export
#' @md
get_MKalpha = function (X, level=0.1, time_dependency_option="AR1") {
    alpha = EXstat::GeneralMannKendall(X, level=level,
                                       time_dependency_option=time_dependency_option,
                                       do_detrending=TRUE)$a
    return (alpha)
}

## 1.2. Test result __________________________________________________
#' @title Get Mann-Kendall Test Decision
#' @description Extracts the hypothesis test result (H) from the Generalized Mann-Kendall 
#' trend test, indicating whether a significant trend exists.
#'
#' @param X Numeric vector of values to test for trend
#' @inheritParams EXstat::GeneralMannKendall
#' 
#' @return Logical value indicating test result:
#' \itemize{
#'   \item TRUE if significant trend exists (reject null hypothesis)
#'   \item FALSE if no significant trend (fail to reject null hypothesis)
#' }
#'
#' @details 
#' The H statistic indicates:
#' \itemize{
#'   \item TRUE (significant trend) when p-value ≤ alpha
#'   \item FALSE (no significant trend) when p-value > alpha
#' }
#'
#' @examples
#' data(precipitation)
#' # Check for significant trend in precipitation
#' trend_exists <- get_MKH(precipitation$P)
#'
#' @seealso \code{\link[EXstat]{GeneralMannKendall}} for the full test implementation
#' @export
#' @md
get_MKH = function (X, level=0.1, time_dependency_option="AR1") {
    H = EXstat::GeneralMannKendall(X, level=level,
                                   time_dependency_option=time_dependency_option,
                                   do_detrending=TRUE)$H
    return (H)    
}

## 1.2. Test result __________________________________________________
#' @title Get Mann-Kendall P-Value
#' @description Extracts the p-value from the Generalized Mann-Kendall trend test.
#'
#' @param X Numeric vector of values to test for trend
#' @inheritParams EXstat::GeneralMannKendall
#'
#' @return Numeric p-value between 0 and 1 indicating the probability of observing 
#' the trend by chance if no true trend exists.
#'
#' @details 
#' Interpretation guidelines:
#' \itemize{
#'   \item p ≤ 0.01: Very strong evidence against null hypothesis
#'   \item 0.01 < p ≤ 0.05: Strong evidence
#'   \item 0.05 < p ≤ 0.1: Weak evidence
#'   \item p > 0.1: Little or no evidence
#' }
#'
#' @examples
#' data(temperature)
#' # Get p-value for temperature trend
#' pval <- get_MKp(temperature$T)
#' print(paste("Trend significance:", ifelse(pval < 0.05, "Significant", "Not significant")))
#'
#' @seealso \code{\link[EXstat]{GeneralMannKendall}} for the full test implementation
#' @export
#' @md
get_MKp = function (X, level=0.1, time_dependency_option="AR1") {
    p = EXstat::GeneralMannKendall(X, level=level,
                                   time_dependency_option=time_dependency_option,
                                   do_detrending=TRUE)$p
    return (p)    
}

