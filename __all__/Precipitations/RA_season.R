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
CARD$P.variable_en = c("RA_DJF", "RA_MAM", "RA_JJA", "RA_SON")
CARD$P.unit_en = "mm"
CARD$P.name_en = c("Cumulative daily precipitation of each winter",
                   "Cumulative daily precipitation of each spring",
                   "Cumulative daily precipitation of each summer",
                   "Cumulative daily precipitation of each autumn")
CARD$P.description_en = c("Months of December, January, and February",
                          "Months of March, April, and May",
                          "Months of June, July, and August",
                          "Months of September, October, and November")
CARD$P.method_en = ""
CARD$P.topic_en = "Precipitation, Moderate, Intensity"

### French ___________________________________________________________
CARD$P.variable_fr = c("RA_DJF", "RA_MAM", "RA_JJA", "RA_SON")
CARD$P.unit_fr = "mm"
CARD$P.name_fr = c("Cumul des précipitations journalières de chaque hiver",
                   "Cumul des précipitations journalières de chaque printemps",
                   "Cumul des précipitations journalières de chaque été",
                   "Cumul des précipitations journalières de chaque automne")
CARD$P.description_fr = c("Mois de décembre, janvier et février",
                          "Mois de mars, avril et mai",
                          "Mois de juin, juillet et août",
                          "Mois de septembre, octobre et novembre")
CARD$P.method_fr = ""
CARD$P.topic_fr = "Précipitations, Modérée, Intensité"

### Global ___________________________________________________________
CARD$P.is_date = FALSE
CARD$P.is_normalize = FALSE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"


## PROCESS ___________________________________________________________
### P1 _______________________________________________________________
CARD$P1.funct = list(RA=sumNA)
CARD$P1.funct_args = list("R", na.rm=TRUE)
CARD$P1.time_step = "year-season"
CARD$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE

