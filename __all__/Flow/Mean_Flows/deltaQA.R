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
CARD$P.variable_en = c("deltaQA_{2040-2069}", "deltaQA_{2070-2099}")
CARD$P.unit_en = "m^{3}.s^{-1}.year^{-1}"
CARD$P.name_en = "Relative difference in annual mean daily discharge between a future period and a past reference period"
CARD$P.description_en = ""
CARD$P.method_en = ""
CARD$P.sampling_period_en = "09-01"
CARD$P.topic_en = "Flow, Mean Flows, Relative Difference"

### French ___________________________________________________________
CARD$P.variable_fr = c("deltaQA_{2040-2069}", "deltaQA_{2070-2099}")
CARD$P.unit_fr = "m^{3}.s^{-1}.an^{-1}"
CARD$P.name_fr = "Différence relative des moyennes annuelles des débits journaliers entre une période futur et une période passée de référence"
CARD$P.description_fr = ""
CARD$P.method_fr = ""
CARD$P.sampling_period_fr = "01-09"
CARD$P.topic_fr = "Débit, Moyennes Eaux, Différence relative"

### Global ___________________________________________________________
CARD$P.is_date = FALSE
CARD$P.to_normalize = FALSE
CARD$P.palette = NULL


## PROCESS ___________________________________________________________
### P2 _______________________________________________________________
CARD$P2.funct = list("deltaQA_{2040-2069}"=deltaX, "deltaQA_{2070-2099}"=deltaX)
CARD$P2.funct_args = list(list("QA", "Date", past=c("1976-01-01", "2005-12-31"), futur=c("2040-01-01", "2069-12-31")), list("QA", "Date", past=c("1976-01-01", "2005-12-31"), futur=c("2070-01-01", "2099-12-31")))
CARD$P2.time_step = "none"

