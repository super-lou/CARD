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
CARD$P.variable_en = c("QA_jan", "QA_feb", "QA_mar", "QA_apr",
                       "QA_may", "QA_jun", "QA_jul", "QA_aug",
                       "QA_sep", "QA_oct", "QA_nov", "QA_dec")
CARD$P.unit_en = "m^{3}.s^{-1}"
CARD$P.name_en = c("Average daily discharge for each January",
                   "Average daily discharge for each February",
                   "Average daily discharge for each March",
                   "Average daily discharge for each April",
                   "Average daily discharge for each May",
                   "Average daily discharge for each June",
                   "Average daily discharge for each July",
                   "Average daily discharge for each August",
                   "Average daily discharge for each September",
                   "Average daily discharge for each October",
                   "Average daily discharge for each November",
                   "Average daily discharge for each December")
CARD$P.description_en = ""
CARD$P.method_en = ""
CARD$P.topic_en = "Flow, Mean Flows, Intensity"

### French ___________________________________________________________
CARD$P.variable_fr = c("QA_janv", "QA_fevr", "QA_mars", "QA_avril",
                       "QA_mai", "QA_juin", "QA_juil", "QA_aout",
                       "QA_sept", "QA_oct", "QA_nov", "QA_dec")
CARD$P.unit_fr = "m^{3}.s^{-1}"
CARD$P.name_fr = c("Moyenne des débits journaliers de chaque janvier",
                   "Moyenne des débits journaliers de chaque février",
                   "Moyenne des débits journaliers de chaque mars",
                   "Moyenne des débits journaliers de chaque avril",
                   "Moyenne des débits journaliers de chaque mai",
                   "Moyenne des débits journaliers de chaque juin",
                   "Moyenne des débits journaliers de chaque juillet",
                   "Moyenne des débits journaliers de chaque août",
                   "Moyenne des débits journaliers de chaque septembre",
                   "Moyenne des débits journaliers de chaque octobre",
                   "Moyenne des débits journaliers de chaque novembre",
                   "Moyenne des débits journaliers de chaque décembre")
CARD$P.description_fr = ""
CARD$P.method_fr = ""
CARD$P.topic_fr = "Débit, Moyennes Eaux, Intensité"

### Global ___________________________________________________________
CARD$P.is_date = FALSE
CARD$P.to_normalize = TRUE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"


## PROCESS ___________________________________________________________
### P1 _______________________________________________________________
CARD$P1.funct = list(QA=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.time_step = "year-month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE

