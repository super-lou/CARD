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
CARD$P.variable_en = c("CR_DJF", "CR_MAM", "CR_JJA", "CR_SON")
CARD$P.unit_en = "without unit"
CARD$P.name_en = c("Winter precipitation correction coefficient",
                   "Spring precipitation correction coefficient",
                   "Summer precipitation correction coefficient",
                   "Autumn precipitation correction coefficient")
CARD$P.description_en = ""
CARD$P.method_en = ""
CARD$P.topic_en = "Precipitations, Moderate, Parameterization"

### French ___________________________________________________________
CARD$P.variable_fr = c("CR_DJF", "CR_MAM", "CR_JJA", "CR_SON")
CARD$P.unit_fr = "sans unité"
CARD$P.name_fr = c("Coefficient correctif des précipitations hivernales",
                   "Coefficient correctif des précipitations printanières",
                   "Coefficient correctif des précipitations estivales",
                   "Coefficient correctif des précipitations automnales")
CARD$P.description_fr = ""
CARD$P.method_fr = ""
CARD$P.topic_fr = "Précipitations, Modérée, Paramétristation"

### Global ___________________________________________________________
CARD$P.is_date = FALSE
CARD$P.to_normalize = FALSE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"


## PROCESS ___________________________________________________________
### P1 _______________________________________________________________
CARD$P1.funct = list(RA_obs=sumNA, RA_sim=sumNA)
CARD$P1.funct_args = list(list("R_obs", na.rm=TRUE), list("R_sim", na.rm=TRUE))
CARD$P1.time_step = "year-season"
CARD$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE

### P2 _______________________________________________________________
CARD$P2.funct = list(meanRA_obs_DJF=mean, meanRA_obs_MAM=mean, meanRA_obs_JJA=mean, meanRA_obs_SON=mean, meanRA_sim_DJF=mean, meanRA_sim_MAM=mean, meanRA_sim_JJA=mean, meanRA_sim_SON=mean)
CARD$P2.funct_args = list(list("RA_obs_DJF", na.rm=TRUE), list("RA_obs_MAM", na.rm=TRUE), list("RA_obs_JJA", na.rm=TRUE), list("RA_obs_SON", na.rm=TRUE), list("RA_sim_DJF", na.rm=TRUE), list("RA_sim_MAM", na.rm=TRUE), list("RA_sim_JJA", na.rm=TRUE), list("RA_sim_SON", na.rm=TRUE))
CARD$P2.time_step = "none"

### P3 _______________________________________________________________
CARD$P3.funct = list(CR_DJF=divided, CR_MAM=divided, CR_JJA=divided, CR_SON=divided)
CARD$P3.funct_args = list(list("meanRA_sim_DJF", "meanRA_obs_DJF"), list("meanRA_sim_MAM", "meanRA_obs_MAM"), list("meanRA_sim_JJA", "meanRA_obs_JJA"), list("meanRA_sim_SON", "meanRA_obs_SON"))
CARD$P3.time_step = "none"

