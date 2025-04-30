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
#' @title get_MKalpha 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
get_MKalpha = function (X, level=0.1, time_dependency_option="AR1") {
    alpha = EXstat::GeneralMannKendall(X, level=level,
                                       time_dependency_option=time_dependency_option,
                                       do_detrending=TRUE)$a
    return (alpha)
}

## 1.2. Test result __________________________________________________
#' @title get_MKH 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
get_MKH = function (X, level=0.1, time_dependency_option="AR1") {
    H = EXstat::GeneralMannKendall(X, level=level,
                                   time_dependency_option=time_dependency_option,
                                   do_detrending=TRUE)$H
    return (H)    
}

## 1.2. Test result __________________________________________________
#' @title get_MKp 
#' @description description
#' @param Q discharge
#' @seealso ref
#' @export
#' @md
get_MKp = function (X, level=0.1, time_dependency_option="AR1") {
    p = EXstat::GeneralMannKendall(X, level=level,
                                   time_dependency_option=time_dependency_option,
                                   do_detrending=TRUE)$p
    return (p)    
}

