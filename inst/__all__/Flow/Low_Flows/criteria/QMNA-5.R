#   ___                _ 
#  / __| __ _  _ _  __| |
# | (__ / _` || '_|/ _` |
#  \___|\__,_||_|  \__,_|
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


## INFO ______________________________________________________________
### English __________________________________________________________
CARD$P.variable_en = "QMNA-5"
CARD$P.unit_en = "m^{3}.s^{-1}"
CARD$P.name_en = "Annual minimum of monthly flows with a return period of 5 years"
CARD$P.description_en = ""
CARD$P.method_en = "1. monthly aggregation - mean
2. annual aggregation [Month of maximum monthly flows] - minimum
3. no temporal aggregation - calculation of 5-year return period flow with the log-normal distribution"
CARD$P.sampling_period_en = "Month of maximum monthly flows"
CARD$P.topic_en = "Flow, Low Flow, Intensity"

### French ___________________________________________________________
CARD$P.variable_fr = "QMNA-5"
CARD$P.unit_fr = "m^{3}.s^{-1}"
CARD$P.name_fr = "Minimum annuel des débits mensuels de période de retour 5 ans"
CARD$P.description_fr = ""
CARD$P.method_fr = "1. agrégation mensuelle - moyenne
2. agrégation annuelle [Mois du maximum des débits mensuels] - minimum
3. aucune agrégation temporelle - calcul du débit de période de retour 5 ans avec la loi log-normal"
CARD$P.topic_fr = "Débit, Basses Eaux, Intensité"
CARD$P.sampling_period_fr = "Mois du maximum des débits mensuels"

### Global ___________________________________________________________
CARD$P.input_vars = "Q"
CARD$P.preferred_sampling_period = "01-01"
CARD$P.is_date = FALSE
CARD$P.to_normalise = TRUE
CARD$P.palette = NULL


## PROCESS ___________________________________________________________
### P1 _______________________________________________________________
CARD$P1.funct = list(QMA=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.time_step = "year-month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.keep = "all"

### P2 _______________________________________________________________
CARD$P2.funct = list(QMNA=minNA)
CARD$P2.funct_args = list("QMA", na.rm=TRUE)
CARD$P2.time_step = "year"
CARD$P2.sampling_period = list(max, list("QMA", na.rm=TRUE))
CARD$P2.NApct_lim = 3

### P3 _______________________________________________________________
CARD$P3.funct = list("QMNA-5"=get_Xn)
CARD$P3.funct_args = list("QMNA", returnPeriod=5, waterType="low")
CARD$P3.time_step = "none"

