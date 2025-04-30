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


#   ___  _       _           _ 
#  / __|| | ___ | |__  __ _ | |
# | (_ || |/ _ \| '_ \/ _` || |
#  \___||_|\___/|_.__/\__,_||_| ______________________________________
## 0. BASIC __________________________________________________________
#' @title minus 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
minus = function (a, b, first=FALSE) {
    if (all(is.na(a)) | all(is.na(b))) {
        return (NA)
    } else {
        if (first) {
            aRLE = rle(a[!is.na(a)])
            a = aRLE$values[which.max(aRLE$lengths)]
            bRLE = rle(b[!is.na(b)])
            b = bRLE$values[which.max(bRLE$lengths)]
        }
        return (a - b)
    }
}

#' @title divided 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
divided = function (a, b, first=FALSE) {
    if (all(is.na(a)) | all(is.na(b))) {
        return (NA)
    } else {
        if (first) {
            aRLE = rle(a[!is.na(a)])
            a = aRLE$values[which.max(aRLE$lengths)]
            bRLE = rle(b[!is.na(b)])
            b = bRLE$values[which.max(bRLE$lengths)]
        }
        return (a / b)
    }
}

#' @title get_deltaX
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
get_deltaX = function (X, Date, past, futur, to_normalise,
                       returnPeriod=NULL, waterType='low',
                       Q_for_BFI=NULL) {
    
    past = as.Date(past)
    OKpast = past[1] <= Date & Date <= past[2]
    Xpast = X[OKpast]

    futur = as.Date(futur)
    OKfutur = futur[1] <= Date & Date <= futur[2]
    Xfutur = X[OKfutur]
    
    if (!is.null(returnPeriod)) {
        agg_Xpast = get_Xn(Xpast,
                           returnPeriod=returnPeriod,
                           waterType=waterType)
        agg_Xfutur = get_Xn(Xfutur,
                            returnPeriod=returnPeriod,
                            waterType=waterType)
        
    } else if (!is.null(Q_for_BFI)) {
        Qpast = Q_for_BFI[OKpast]
        Qfutur = Q_for_BFI[OKfutur]
        agg_Xpast = get_BFI(Q=Qpast, BF=Xpast, na.rm=TRUE)
        agg_Xfutur = get_BFI(Q=Qfutur, BF=Xfutur, na.rm=TRUE)
        
    } else {
        agg_Xpast = mean(Xpast, na.rm=TRUE)
        agg_Xfutur = mean(Xfutur, na.rm=TRUE)
    }

    if (to_normalise) {
        deltaX = (agg_Xfutur - agg_Xpast) / agg_Xpast * 100
    } else {
        deltaX = agg_Xfutur - agg_Xpast
    }
    return (deltaX)
}

## 1. MIN MAX ________________________________________________________
#' @title minNA 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
minNA = function (X, div=1, na.rm=TRUE) {
    if (all(is.na(X))) {
        return (NA)
    } else {
        return (min(X, na.rm=na.rm) / div)
    }
}

#' @title maxNA 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
maxNA = function (X, div=1, na.rm=TRUE) {
    if (all(is.na(X))) {
        return (NA)
    } else {
        return (max(X, na.rm=na.rm) / div)
    }
}

#' @title sumNA 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
sumNA = function (X, div=1, na.rm=TRUE) {
    if (all(is.na(X))) {
        return (NA)
    } else {
        return (sum(X, na.rm=na.rm) / div)
    }
}


## 2. WHICH MIN MAX __________________________________________________
#' @title which.minNA 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
which.minNA = function (X) {
    idMin = which.min(X)
    if (identical(idMin, integer(0))) {
        idMin = NA
    }
    return (idMin)
}

#' @title which.maxNA 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
which.maxNA = function (X) {
    idMax = which.max(X)
    if (identical(idMax, integer(0))) {
        idMax = NA
    }
    return (idMax)
}


## 3. ROLLING AVERAGE ________________________________________________
#' @title rollmean_center 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
rollmean_center = function (X, k, isCyclical=FALSE) {
    if (isCyclical) {
        n = length(X)
        X = c(X[(n-k+1):n],
              X,
              X[1:(k+1)])
    }    
    X = RcppRoll::roll_mean(X, n=k, fill=NA,
                            align="center",
                            na.rm=FALSE)
    if (isCyclical) {
        n = length(X)
        X = X[(k+1):(n-(k+1))]
    }
    return (X)
}

#' @title rollsum_center 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
rollsum_center = function (X, k, isCyclical=FALSE) {
    if (isCyclical) {
        n = length(X)
        X = c(X[(n-k+1):n],
              X,
              X[1:(k+1)])
    }    
    X = RcppRoll::roll_sum(X, n=k, fill=NA,
                           align="center",
                           na.rm=FALSE)
    if (isCyclical) {
        n = length(X)
        X = X[(k+1):(n-(k+1))]
    }
    return (X)
}


## 4. CIRCULAR STAT __________________________________________________
circularTWEAK = function (X, Y, periodicity) {
    XY2add = abs(X - Y) > (periodicity/2)
    XYmin = pmin(X, Y, na.rm=TRUE)
    XisMin = X == XYmin
    YisMin = Y == XYmin

    XY2add[is.na(XY2add)] = FALSE
    XisMin[is.na(XisMin)] = FALSE
    YisMin[is.na(YisMin)] = FALSE
    
    X[XY2add & XisMin] = X[XY2add & XisMin] + periodicity
    Y[XY2add & YisMin] = Y[XY2add & YisMin] + periodicity

    res = list(X=X, Y=Y)
    return (res)
}

#' @title circular_minus 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
circular_minus = function (X, Y, periodicity) {
    res = circularTWEAK(X, Y, periodicity)
    X = res$X
    Y = res$Y
    return (X - Y)
}

#' @title circular_divided 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
circular_divided = function (X, Y, periodicity) {
    res = circularTWEAK(X, Y, periodicity)
    X = res$X
    Y = res$Y
    return (X / Y)
}

#' @title circular_median 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
circular_median = function (X, periodicity, na.rm=TRUE) {    
    scalingFactor = 2 * pi / periodicity
    radians = X * scalingFactor
    sines = sin(radians)
    cosines = cos(radians)
    median = atan2(median(sines, na.rm=na.rm), median(cosines, na.rm=na.rm)) / scalingFactor

    if (is.na(median)) {
        res = NA
    } else {
        if (median >= 0) {
            res = median
        } else {
            res = median + periodicity
        }
    }
    return (res)
}


