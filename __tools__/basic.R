# Copyright 2022-2023 Louis Héraut (louis.heraut@inrae.fr)*1
#
# *1   INRAE, France
#
# This file is part of CARD R library.
#
# CARD R library is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# CARD R library is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with CARD R library.
# If not, see <https://www.gnu.org/licenses/>.


#  ___            _     
# | _ ) __ _  ___(_) __ 
# | _ \/ _` |(_-<| |/ _|
# |___/\__,_|/__/|_|\__| _____________________________________________
## 0. BASIC __________________________________________________________
minus = function (a, b, first=FALSE) {
    if (first) {
        aRLE = rle(a[!is.na(a)])
        a = aRLE$values[which.max(aRLE$lengths)]
        bRLE = rle(b[!is.na(b)])
        b = bRLE$values[which.max(bRLE$lengths)]
    }
    return (a - b)
}

divided = function (a, b, first=FALSE) {
    if (first) {
        aRLE = rle(a[!is.na(a)])
        a = aRLE$values[which.max(aRLE$lengths)]
        bRLE = rle(b[!is.na(b)])
        b = bRLE$values[which.max(bRLE$lengths)]
    }
    return (a / b)
}

## 1. MIN MAX ________________________________________________________
minNA = function (X, div=1, na.rm=TRUE) {
    if (all(is.na(X))) {
        return (NA)
    } else {
        return (min(X, na.rm=na.rm) / div)
    }
}

maxNA = function (X, div=1, na.rm=TRUE) {
    if (all(is.na(X))) {
        return (NA)
    } else {
        return (max(X, na.rm=na.rm) / div)
    }
}


## 2. WHICH MIN MAX __________________________________________________
which.minNA = function (X) {
    idMin = which.min(X)
    if (identical(idMin, integer(0))) {
        idMin = NA
    }
    return (idMin)
}

which.maxNA = function (X) {
    idMax = which.max(X)
    if (identical(idMax, integer(0))) {
        idMax = NA
    }
    return (idMax)
}


## 3. ROLLING AVERAGE ________________________________________________
#' @title Rolling average
#' @export
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

circular_minus = function (X, Y, periodicity) {
    res = circularTWEAK(X, Y, periodicity)
    X = res$X
    Y = res$Y
    return (X - Y)
}
    
circular_divided = function (X, Y, periodicity) {
    res = circularTWEAK(X, Y, periodicity)
    X = res$X
    Y = res$Y
    return (X / Y)
}

circular_median = function (X, periodicity, na.rm=TRUE) {    
    scalingFactor = 2 * pi / periodicity;
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


# ## 5. REGIME HYDRO ___________________________________________________
# find_regimeHydro = function (QM_code, returnList=TRUE) {
#     xref = matrix(
#         c(0.099, 0.100, 0.101, 0.099, 0.088, 0.078, 0.072,
#           0.064, 0.064, 0.069, 0.076, 0.089,
#           0.133, 0.126, 0.111, 0.110, 0.081, 0.056, 0.038,
#           0.027, 0.042, 0.063, 0.098, 0.117,
#           0.128, 0.142, 0.122, 0.128, 0.105, 0.065, 0.035,
#           0.024, 0.031, 0.044, 0.074, 0.101,
#           0.157, 0.130, 0.119, 0.094, 0.062, 0.042, 0.028,
#           0.021, 0.035, 0.062, 0.099, 0.150,
#           0.204, 0.163, 0.118, 0.102, 0.060, 0.030, 0.018,
#           0.012, 0.023, 0.041, 0.087, 0.143,
#           0.156, 0.154, 0.117, 0.119, 0.086, 0.044, 0.025,
#           0.015, 0.025, 0.044, 0.089, 0.127,
#           0.139, 0.092, 0.082, 0.099, 0.087, 0.039, 0.015,
#           0.012, 0.036, 0.108, 0.159, 0.131,
#           0.112, 0.098, 0.101, 0.125, 0.122, 0.072, 0.036,
#           0.024, 0.039, 0.067, 0.102, 0.102,
#           0.058, 0.050, 0.100, 0.142, 0.158, 0.092, 0.067,
#           0.050, 0.042, 0.058, 0.083, 0.100,
#           0.050, 0.050, 0.058, 0.083, 0.150, 0.167, 0.117,
#           0.083, 0.058, 0.058, 0.067, 0.058,
#           0.033, 0.025, 0.033, 0.075, 0.167, 0.217, 0.142,
#           0.092, 0.067, 0.058, 0.050, 0.042,
#           0.017, 0.008, 0.017, 0.042, 0.108, 0.183, 0.200,
#           0.175, 0.117, 0.067, 0.042, 0.025),
#         ncol=12, byrow=TRUE)
#     colnames(xref) = seq(1, 12, 1)
#     row.names(xref) = c('GROUP1', 'GROUP2', 'GROUP3', 'GROUP4',
#                         'GROUP5', 'GROUP6', 'GROUP7', 'GROUP8',
#                         'GROUP9', 'GROUP10', 'GROUP11', 'GROUP12')

#     id = 0
#     typology = ""
#     distance = rep(0, length(xref[,1]))
#     distancemin = 0
#     for (j in 1:length(xref[,1])) {
#         distance[j] = sum((QM_code / mean(QM_code, na.rm=TRUE) - xref[j, ])^2)
#     }
#     id = which.min(distance)
#     distancemin = distance[which.min(distance)]
    
#     if (id < 7) {
#         typology = "Pluvial"

#     } else if (id >= 7 & id < 10) {
#         typology = "Transition"
        
#     } else if (id >= 10) {
#         typology = "Nival Glaciaire"
#     } 

#     if (returnList) {
#         regimeHydro = list(id=id,
#                            typology=typology)
#     } else {
#         regimeHydro = paste0(typology,"_",id)
#     }
#     return (regimeHydro)
# }
