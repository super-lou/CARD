#   ___                _ 
#  / __| __ _  _ _  __| |
# | (__ / _` || '_|/ _` |
#  \___|\__,_||_|  \__,_|
# Copyright 2022-2024 Louis Héraut (louis.heraut@inrae.fr)*1
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


## INFO ______________________________________________________________
### English __________________________________________________________
CARD$P.variable_en = c("RMAl_jan", "RMAl_feb", "RMAl_mar", "RMAl_apr",
                       "RMAl_may", "RMAl_jun", "RMAl_jul", "RMAl_aug",
                       "RMAl_sep", "RMAl_oct", "RMAl_nov", "RMAl_dec")
CARD$P.unit_en = "mm"
CARD$P.name_en = ""
CARD$P.name_en = c("Cumulative daily liquid precipitation for each January",
                   "Cumulative daily liquid precipitation for each February",
                   "Cumulative daily liquid precipitation for each March",
                   "Cumulative daily liquid precipitation for each April",
                   "Cumulative daily liquid precipitation for each May",
                   "Cumulative daily liquid precipitation for each June",
                   "Cumulative daily liquid precipitation for each July",
                   "Cumulative daily liquid precipitation for each August",
                   "Cumulative daily liquid precipitation for each September",
                   "Cumulative daily liquid precipitation for each October",
                   "Cumulative daily liquid precipitation for each November",
                   "Cumulative daily liquid precipitation for each December")
CARD$P.description_en = ""
CARD$P.method_en = ""
CARD$P.topic_en = "Precipitations, Moderate, Intensity"

### French ___________________________________________________________
CARD$P.variable_fr = c("RMAl_janv", "RMAl_fevr", "RMAl_mars",
                       "RMAl_avril", "RMAl_mai", "RMAl_juin",
                       "RMAl_juil", "RMAl_aout", "RMAl_sept",
                       "RMAl_oct", "RMAl_nov", "RMAl_dec")
CARD$P.unit_fr = "mm"
CARD$P.name_fr = c("Cumul des précipitations liquides journalières de chaque janvier",
                   "Cumul des précipitations liquides journalières de chaque février",
                   "Cumul des précipitations liquides journalières de chaque mars",
                   "Cumul des précipitations liquides journalières de chaque avril",
                   "Cumul des précipitations liquides journalières de chaque mai",
                   "Cumul des précipitations liquides journalières de chaque juin",
                   "Cumul des précipitations liquides journalières de chaque juillet",
                   "Cumul des précipitations liquides journalières de chaque août",
                   "Cumul des précipitations liquides journalières de chaque septembre",
                   "Cumul des précipitations liquides journalières de chaque octobre",
                   "Cumul des précipitations liquides journalières de chaque novembre",
                   "Cumul des précipitations liquides journalières de chaque décembre")
CARD$P.description_fr = ""
CARD$P.method_fr = ""
CARD$P.topic_fr = "Précipitations, Modérée, Intensité"

### Global ___________________________________________________________
CARD$P.is_date = FALSE
CARD$P.to_normalize = FALSE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"


## PROCESS ___________________________________________________________
### P1 _______________________________________________________________
CARD$P1.funct = list(RMAl=sumNA)
CARD$P1.funct_args = list("Rl", na.rm=TRUE)
CARD$P1.time_step = "year-month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE
