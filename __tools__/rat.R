# \\\
# Copyright 2021 Leonard Santos (leonard.santos@inrae.fr)*1,
#           2022 Louis Héraut (louis.heraut@inrae.fr)*1
#
# *1   INRAE, France
#
# This file is part of Ashes R package.
#
# Ashes R package is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# Ashes R package is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Ashes R package.
# If not, see <https://www.gnu.org/licenses/>.
# ///


#  ___        _   
# | _ \ __ _ | |_ 
# |   // _` ||  _|
# |_|_\\__,_| \__| ___________________________________________________
#' @title RAT
#' @description Function to apply RAT to simulated and observed
#' streamflows. Missing values in observed data must be NA.
#' @param Dates Date vector with a date format (at daily time step)
#' @param Q_obs Observed streamflows vector [mm/d]
#' @param Q_sim Simulated streamflows vector [mm/d]
#' @param P_obs Observed precipitation vector [mm/d]
#' @param T_obs Observed temperature vector [mm/d]
#' @param E_obs Observed potential evapotranspiration vector [mm/d]
#' @param Thresh Value of the significance threshold to use for the
#' correlation test
#' @return RAT
#' @export
compute_RAT = function (Dates, Q_obs, Q_sim, P_obs, T_obs, E_obs,
                        Thresh=0.05) {
    # --- Step 1: aggregate data on hydrological years
    # Grep first day of hydrological years indexes in the date vector
    Indd = grep(pattern="10-01", x=substr(Dates, 6, 10))
    # Create a vector of the hydrological year number with the same
    # length of Dates vector
    Indd_hydYear = rep(0, length(Dates))
    for (k in seq_along(Indd[-1])) {
        Indd_hydYear[seq(Indd[k], Indd[k+1]-1)] = k
    }
    # Initialise the vectors of yearly data
    Q_obs_year = rep(NaN, length(Indd[-1]))
    Q_sim_year = rep(NaN, length(Indd[-1]))
    P_obs_year = rep(NaN, length(Indd[-1]))
    T_obs_year = rep(NaN, length(Indd[-1]))
    E_obs_year = rep(NaN, length(Indd[-1]))
    # Aggregate the vectors of entry
    for (k in seq_along(Indd[-1])) {
        Q_obs_year[k] = sum(Q_obs[Indd_hydYear == k])
        Q_sim_year[k] = sum(Q_sim[Indd_hydYear == k])
        P_obs_year[k] = sum(P_obs[Indd_hydYear == k])
        T_obs_year[k] = sum(T_obs[Indd_hydYear == k])
        E_obs_year[k] = sum(E_obs[Indd_hydYear == k])
    }
    # --- Step 2: calculate the yearly bias of the model
    Bias_year = Q_sim_year/Q_obs_year - 1
    # --- Step 3: check corrleation between climatic varible and bias
    # Calculate pvalues of Spearman correlation tests
    Cor_P  = cor.test(x=Bias_year[!is.na(Bias_year)],
                      y=P_obs_year[!is.na(Bias_year)],
                      method="spearman", continuity=FALSE,
                      alternative="two.sided")$p.value
    Cor_T  = cor.test(x=Bias_year[!is.na(Bias_year)],
                      y=T_obs_year[!is.na(Bias_year)],
                      method="spearman", continuity=FALSE,
                      alternative="two.sided")$p.value
    Cor_PE = cor.test(x=Bias_year[!is.na(Bias_year)],
                      y=(P_obs_year/E_obs_year)[!is.na(Bias_year)],
                      method="spearman", continuity=FALSE,
                      alternative="two.sided")$p.value
    # Computa RAT result
    RAT_P  = Cor_P < Thresh
    RAT_T  = Cor_T < Thresh
    RAT_PE = Cor_PE < Thresh
    # --- Step 4: return the result of the RAT
    # TRUE means that there is a dependency to the variable (i.e. the
    # model is not robust)
    # FALSE means that there is no dependency to the variable (i.e.
    # the model does not fail to the robustness, 
    # but of course the robustness is not guaranteed)
    res = c(Cor_P, Cor_T, Cor_PE, RAT_P, RAT_T, RAT_PE)
    return (res)
}


compute_RAT_X = function (Bias, X, thresh=0.05) {
    Cor_X  = cor.test(x=Bias[!is.na(Bias)],
                      y=X[!is.na(Bias)],
                      method="spearman", continuity=FALSE,
                      alternative="two.sided")$p.value
    RAT_X  = Cor_X < thresh
    return (RAT_X)
}
