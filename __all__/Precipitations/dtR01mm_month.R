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
CARD$P.variable_en = c("dtR01mm_jan", "dtR01mm_feb", "dtR01mm_mar",
                       "dtR01mm_apr", "dtR01mm_may", "dtR01mm_jun",
                       "dtR01mm_jul", "dtR01mm_aug", "dtR01mm_sep",
                       "dtR01mm_oct", "dtR01mm_nov", "dtR01mm_dec")
CARD$P.unit_en = "day"
CARD$P.name_en = c("Number of rainy days of each January",
                   "Number of rainy days of each February",
                   "Number of rainy days of each March",
                   "Number of rainy days of each April",
                   "Number of rainy days of each May",
                   "Number of rainy days of each June",
                   "Number of rainy days of each July",
                   "Number of rainy days of each August",
                   "Number of rainy days of each September",
                   "Number of rainy days of each October",
                   "Number of rainy days of each November",
                   "Number of rainy days of each December")
CARD$P.description_en = c("Number of days with at least 1 mm of precipitation of each January",
                          "Number of days with at least 1 mm of precipitation of each February",
                          "Number of days with at least 1 mm of precipitation of each March",
                          "Number of days with at least 1 mm of precipitation of each April",
                          "Number of days with at least 1 mm of precipitation of each May",
                          "Number of days with at least 1 mm of precipitation of each June",
                          "Number of days with at least 1 mm of precipitation of each July",
                          "Number of days with at least 1 mm of precipitation of each August",
                          "Number of days with at least 1 mm of precipitation of each September",
                          "Number of days with at least 1 mm of precipitation of each October",
                          "Number of days with at least 1 mm of precipitation of each November",
                          "Number of days with at least 1 mm of precipitation of each December")
CARD$P.method_en = ""
CARD$P.topic_en = "Precipitations, Low, Duration"

### French ___________________________________________________________
CARD$P.variable_fr = c("dtR01mm_janv", "dtR01mm_fevr", "dtR01mm_mars",
                       "dtR01mm_avril", "dtR01mm_mai", "dtR01mm_juin",
                       "dtR01mm_juil", "dtR01mm_aout", "dtR01mm_sept",
                       "dtR01mm_oct", "dtR01mm_nov", "dtR01mm_dec")
CARD$P.unit_fr = "jour"
CARD$P.name_fr = c("Nombre de jours pluvieux de chaque janvier",
                   "Nombre de jours pluvieux de chaque février",
                   "Nombre de jours pluvieux de chaque mars",
                   "Nombre de jours pluvieux de chaque avril",
                   "Nombre de jours pluvieux de chaque mai",
                   "Nombre de jours pluvieux de chaque juin",
                   "Nombre de jours pluvieux de chaque juillet",
                   "Nombre de jours pluvieux de chaque août",
                   "Nombre de jours pluvieux de chaque septembre",
                   "Nombre de jours pluvieux de chaque octobre",
                   "Nombre de jours pluvieux de chaque novembre",
                   "Nombre de jours pluvieux de chaque décembre")
CARD$P.description_fr = c("Nombre de jours avec au moins 1 mm de précipitations de chaque janvier",
                          "Nombre de jours avec au moins 1 mm de précipitations de chaque février",
                          "Nombre de jours avec au moins 1 mm de précipitations de chaque mars",
                          "Nombre de jours avec au moins 1 mm de précipitations de chaque avril",
                          "Nombre de jours avec au moins 1 mm de précipitations de chaque mai",
                          "Nombre de jours avec au moins 1 mm de précipitations de chaque juin",
                          "Nombre de jours avec au moins 1 mm de précipitations de chaque juillet",
                          "Nombre de jours avec au moins 1 mm de précipitations de chaque août",
                          "Nombre de jours avec au moins 1 mm de précipitations de chaque septembre",
                          "Nombre de jours avec au moins 1 mm de précipitations de chaque octobre",
                          "Nombre de jours avec au moins 1 mm de précipitations de chaque novembre",
                          "Nombre de jours avec au moins 1 mm de précipitations de chaque décembre")
CARD$P.method_fr = ""
CARD$P.topic_fr = c("Précipitations", "Faible", "Durée")

### Global ___________________________________________________________
CARD$P.is_date = FALSE
CARD$P.to_normalize = FALSE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"


## PROCESS ___________________________________________________________
### P1 _______________________________________________________________
CARD$P1.funct = list(dtR01mm=apply_threshold)
CARD$P1.funct_args = list("R", lim=1, where=">=", what="length", select="all")
CARD$P1.time_step = "year-month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE

