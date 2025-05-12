# Copyright 2021      Leonard Santos (leonard.santos@inrae.fr)*1,
#           2022-2025 Louis, Héraut <louis.heraut@inrae.fr>*1
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


#  ___        _   
# | _ \ __ _ | |_ 
# |   // _` ||  _|
# |_|_\\__,_| \__| ___________________________________________________
#' @title Compute Robustness Assessment Test (RAT) Indicator
#' @description Evaluates the robustness of a hydrological model performance metric (e.g., Bias) with respect to an explanatory variable (e.g., discharge characteristics), using a Spearman correlation test. The function returns a Boolean indicating whether a significant correlation exists, implying potential lack of robustness.
#'
#' Based on the RAT (Robustness Assessment Test) methodology introduced by Nicolle et al. (2020), this function tests whether the variability of a model performance criterion can be explained by an explanatory variable, suggesting a lack of robustness if so.
#'
#' @param Bias Numeric vector of model performance scores (e.g., Bias) across sub-basins, time periods, or experiments.
#' @param X Numeric vector of an explanatory variable (e.g., flow regime characteristic) of the same length as `Bias`.
#' @param thresh Numeric threshold for the p-value of the Spearman correlation test. Default is 0.05 (5% significance level).
#' @return Logical. Returns `TRUE` if the correlation is significant (i.e., p-value < `thresh`), indicating a lack of robustness; `FALSE` otherwise.
#' @references Nicolle, P., Andréassian, V., Royer-Gaspard, P., Perrin, C., Thirel, G., Coron, L., & Santos, L. (2020). *RAT – a robustness assessment test for calibrated and uncalibrated hydrological models*. Hydrological Sciences Journal, 65(6), 959–972. https://doi.org/10.1080/02626667.2020.1737689
#' @export
#' @md
compute_RAT_X = function (Bias, X, thresh=0.05) {
    isNA_Bias = is.na(Bias)
    isNA_X = is.na(X)
    isNA = isNA_X | isNA_Bias
    if (sum(!isNA) <= 2) {
        return (NA)
    }    
    Cor_X  = cor.test(x=Bias[!isNA],
                      y=X[!isNA],
                      method="spearman", continuity=FALSE,
                      exact=FALSE,
                      alternative="two.sided")$p.value
    RAT_X  = Cor_X < thresh    
    return (RAT_X)
}
