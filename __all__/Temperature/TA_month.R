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
CARD$P.variable_en = c("TA_jan", "TA_feb", "TA_mar", "TA_apr",
                       "TA_may", "TA_jun", "TA_jul", "TA_aug",
                       "TA_sep", "TA_oct", "TA_nov", "TA_dec")
CARD$P.unit_en = "°C"
CARD$P.name_en = c("Average daily temperatures for each January",
                   "Average daily temperatures for each February",
                   "Average daily temperatures for each March",
                   "Average daily temperatures for each April",
                   "Average daily temperatures for each May",
                   "Average daily temperatures for each June",
                   "Average daily temperatures for each July",
                   "Average daily temperatures for each August",
                   "Average daily temperatures for each September",
                   "Average daily temperatures for each October",
                   "Average daily temperatures for each November",
                   "Average daily temperatures for each December")
CARD$P.description_en = ""
CARD$P.method_en = ""
CARD$P.topic_en = "Temperature, Average, Intensity"

### French ___________________________________________________________
CARD$P.variable_fr = c("TA_janv", "TA_fevr", "TA_mars", "TA_avril",
                       "TA_mai", "TA_juin", "TA_juil", "TA_aout",
                       "TA_sept", "TA_oct", "TA_nov", "TA_dec")
CARD$P.unit_fr = "°C"
CARD$P.name_fr = c("Moyenne des températures journalières de chaque janvier",
                   "Moyenne des températures journalières de chaque février",
                   "Moyenne des températures journalières de chaque mars",
                   "Moyenne des températures journalières de chaque avril",
                   "Moyenne des températures journalières de chaque mai",
                   "Moyenne des températures journalières de chaque juin",
                   "Moyenne des températures journalières de chaque juillet",
                   "Moyenne des températures journalières de chaque août",
                   "Moyenne des températures journalières de chaque septembre",
                   "Moyenne des températures journalières de chaque octobre",
                   "Moyenne des températures journalières de chaque novembre",
                   "Moyenne des températures journalières de chaque décembre")
CARD$P.description_fr = ""
CARD$P.method_fr = ""
CARD$P.topic_fr = "Température, Moyenne, Intensité"

### Global ___________________________________________________________
CARD$P.is_date = FALSE
CARD$P.is_normalize = FALSE
CARD$P.palette = "#053061 #2166AC #4393C3 #92C5DE #D1E5F0 #FDDBC7 #F4A582 #D6604D #B2182B #67001F"


## PROCESS ___________________________________________________________
### P1 _______________________________________________________________
CARD$P1.funct = list(TA=mean)
CARD$P1.funct_args = list("T", na.rm=TRUE)
CARD$P1.time_step = "year-month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE

