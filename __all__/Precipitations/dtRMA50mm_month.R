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
CARD$P.variable_en = c("dtRMA50mm_jan", "dtRMA50mm_feb", "dtRMA50mm_mar",
                       "dtRMA50mm_apr", "dtRMA50mm_may", "dtRMA50mm_jun",
                       "dtRMA50mm_jul", "dtRMA50mm_aug", "dtRMA50mm_sep",
                       "dtRMA50mm_oct", "dtRMA50mm_nov", "dtRMA50mm_dec")
CARD$P.unit_en = "day"
CARD$P.name_en = c("Number of extreme rain days for each January",
                   "Number of extreme rain days for each February",
                   "Number of extreme rain days for each March",
                   "Number of extreme rain days for each April",
                   "Number of extreme rain days for each May",
                   "Number of extreme rain days for each June",
                   "Number of extreme rain days for each July",
                   "Number of extreme rain days for each August",
                   "Number of extreme rain days for each September",
                   "Number of extreme rain days for each October",
                   "Number of extreme rain days for each November",
                   "Number of extreme rain days for each December")
CARD$P.description_en = c("Number of days with at least 50 mm of precipitation for each January",
                          "Number of days with at least 50 mm of precipitation for each February",
                          "Number of days with at least 50 mm of precipitation for each March",
                          "Number of days with at least 50 mm of precipitation for each April",
                          "Number of days with at least 50 mm of precipitation for each May",
                          "Number of days with at least 50 mm of precipitation for each June",
                          "Number of days with at least 50 mm of precipitation for each July",
                          "Number of days with at least 50 mm of precipitation for each August",
                          "Number of days with at least 50 mm of precipitation for each September",
                          "Number of days with at least 50 mm of precipitation for each October",
                          "Number of days with at least 50 mm of precipitation for each November",
                          "Number of days with at least 50 mm of precipitation for each December")
CARD$P.method_en = ""
CARD$P.topic_en = "Precipitations, Heavy, Duration"

### French ___________________________________________________________
CARD$P.variable_fr = c("dtRMA50mm_janv", "dtRMA50mm_fevr", "dtRMA50mm_mars",
                       "dtRMA50mm_avril", "dtRMA50mm_mai", "dtRMA50mm_juin",
                       "dtRMA50mm_juil", "dtRMA50mm_aout", "dtRMA50mm_sept",
                       "dtRMA50mm_oct", "dtRMA50mm_nov", "dtRMA50mm_dec")
CARD$P.unit_fr = "jour"
CARD$P.name_fr = c("Nombre de jours de pluie extrème de chaque janvier",
                   "Nombre de jours de pluie extrème de chaque février",
                   "Nombre de jours de pluie extrème de chaque mars",
                   "Nombre de jours de pluie extrème de chaque avril",
                   "Nombre de jours de pluie extrème de chaque mai",
                   "Nombre de jours de pluie extrème de chaque juin",
                   "Nombre de jours de pluie extrème de chaque juillet",
                   "Nombre de jours de pluie extrème de chaque août",
                   "Nombre de jours de pluie extrème de chaque septembre",
                   "Nombre de jours de pluie extrème de chaque octobre",
                   "Nombre de jours de pluie extrème de chaque novembre",
                   "Nombre de jours de pluie extrème de chaque décembre")
CARD$P.description_fr = c("Nombre de jours avec au moins 50 mm de précipitations de chaque janvier",
                          "Nombre de jours avec au moins 50 mm de précipitations de chaque février",
                          "Nombre de jours avec au moins 50 mm de précipitations de chaque mars",
                          "Nombre de jours avec au moins 50 mm de précipitations de chaque avril",
                          "Nombre de jours avec au moins 50 mm de précipitations de chaque mai",
                          "Nombre de jours avec au moins 50 mm de précipitations de chaque juin",
                          "Nombre de jours avec au moins 50 mm de précipitations de chaque juillet",
                          "Nombre de jours avec au moins 50 mm de précipitations de chaque août",
                          "Nombre de jours avec au moins 50 mm de précipitations de chaque septembre",
                          "Nombre de jours avec au moins 50 mm de précipitations de chaque octobre",
                          "Nombre de jours avec au moins 50 mm de précipitations de chaque novembre",
                          "Nombre de jours avec au moins 50 mm de précipitations de chaque décembre")
CARD$P.method_fr = ""
CARD$P.topic_fr = "Précipitations, Forte, Durée"

### Global ___________________________________________________________
CARD$P.is_date = FALSE
CARD$P.to_normalize = FALSE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"


## PROCESS ___________________________________________________________
### P1 _______________________________________________________________
CARD$P1.funct = list(dtRMA50mm=apply_threshold)
CARD$P1.funct_args = list("R", lim=50, where=">=", what="length", select="all")
CARD$P1.time_step = "year-month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE
