# Copyright 2022      David, Dorchies <david.dorchies@inrae.fr>*1,
#           2022-2025 Louis, Héraut <louis.heraut@inrae.fr>*2
#
# *1 INRAE, UMR G-Eau, Montpellier, France
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


#  ___       _                                        _          _
# | _ \ ___ | |_  _  _  _ _  _ _      _ __  ___  _ _ (_) ___  __| |
# |   // -_)|  _|| || || '_|| ' \    | '_ \/ -_)| '_|| |/ _ \/ _` |
# |_|_\\___| \__| \_,_||_|  |_||_| _ | .__/\___||_|  |_|\___/\__,_| __
## 1. GUMBEL LAW ___________________ |_| _____________________________
#' @title Estimate Gumbel Distribution Parameters
#' @description Computes the location (`a`) and scale (`b`) parameters of the Gumbel distribution based on a numeric vector of annual maximum flows.
#' @param X Numeric vector representing the maximum flows (e.g., annual daily maxima).
#' @return A [list] with `a` the location parameter and `b` the scale parameter).
#' @export
compute_GumbelParams = function (X) {
    if (!is.numeric(X)) {
        stop("maxFlows must be of class 'numeric'")
    }
    # Euler constant
    c_euler = 0.5772
    # Scale parameter
    b = sqrt(6) / pi * sd(X, na.rm=TRUE)
    # Location parameter
    a = mean(X, na.rm=TRUE) - b*c_euler
    GumbelParams = list(a=a, b=b)
    return (GumbelParams)
}

#' @title Compute Quantile from Gumbel Law
#' @description Calculates the discharge value (quantile) associated with a given return period using the Gumbel distribution parameters.
#' @param a Numeric value of the Gumbel distribution location parameter.
#' @param b Numeric value of the Gumbel distribution scale parameter.
#' @param returnPeriod Numeric value of the return period (in years or consistent time unit).
#' @return Numeric value representing the estimated discharge for the given return period.
#' @export
compute_GumbelLaw = function (a, b, returnPeriod) {
    if (!is.numeric(returnPeriod)) {
        stop("returnPeriod must be of class 'numeric'")
    }
    if (returnPeriod <= 1) {
        stop("returnPeriod must be greater than 1")
    }
    # Non-exceeding frequency
    F_x = 1 - (1 / returnPeriod)
    # Reduced gumbel variable
    u = -log(-log(F_x))

    Xn = b*u + a
    return (Xn)
}


## 2. LOG NORMAL _____________________________________________________
#' @title Estimate Return Value using Log-Normal Distribution
#' @description Calculation of a value according to a return period according to a Galton distribution (log-normal)
#' @param X Numeric vector of annual data (e.g., minimum or maximum discharge).
#' @param returnPeriod Numeric value of the return period in years.
#' @return Numeric value for the return period according to Galton distribution.
#' @export
compute_LogNormal = function(X, returnPeriod) {
    if (!is.numeric(returnPeriod)) {
        stop("returnPeriod must be of class 'numeric'")
    }
    if (returnPeriod <= 1) {
        stop("returnPeriod must be superior to 1")
    }
    X = X[!is.na(X)]
    nbY = length(X)
    if (nbY == 0) return(NA)
    Freq = 1 / returnPeriod
    nbXnul = length(X[X == 0])
    if ((nbXnul / nbY) <= Freq ) {
        Freq = Freq - (nbXnul / nbY)
        Xn = exp(qnorm(Freq) * sd(log(X[X > 0])) +
                 mean(log(X[X > 0])))
    } else {
        Xn = 0
    }
    return (Xn)
}


## 3. USE ____________________________________________________________
#' @title Generalized Return Value Calculator
#' @description Computes the return discharge value for a given time series and return period, based on the specified hydrological regime (`low` or `high` waters).
#' @param X Numeric vector of flow values.
#' @param returnPeriod Numeric value of the return period.
#' @param waterType Character string, either `'low'` for log-normal estimation or `'high'` for Gumbel-based estimation.
#' @param Date Optional vector of dates corresponding to the flow values.
#' @param period Optional length-2 vector specifying the start and end of the period to consider (must match class of `Date`).
#' @return Numeric value of the estimated discharge for the given return period.
#' @seealso \code{\link{compute_GumbelParams}}, \code{\link{compute_GumbelLaw}}, \code{\link{compute_LogNormal}}
#' @export
#' @md
get_Xn = function (X, returnPeriod, waterType='low',
                   Date=NULL, period=NULL) {

    if (!is.null(Date) & !is.null(period)) {
        ok = period[1] <= Date & Date <= period[2]
        X = X[ok]
    }

    if (waterType == "high") {
        res = compute_GumbelParams(X)
        a = res$a
        b = res$b
        Xn = compute_GumbelLaw(a, b, returnPeriod)
    } else if (waterType == "low") {
        ### /!\ VCNn-n do no give same results between ashes and
        ### SeineBassin2. It is due to difference in NA positionning
        ### when there is missing values.
        Xn = compute_LogNormal(X, returnPeriod)
    }
    return (Xn)
}
