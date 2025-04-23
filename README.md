# EXstat.CARD [<img src="figures/flower_alt_hex.png" align="right" width=160 height=160 alt=""/>](https://github.com/super-lou/EXstat/)

<!-- badges: start -->
[![R-CMD-check](https://github.com/super-lou/EXstat.CARD/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/super-lou/EXstat.CARD/actions/workflows/R-CMD-check.yaml)
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-green)](https://lifecycle.r-lib.org/articles/stages.html)
![](https://img.shields.io/github/last-commit/super-lou/CARD)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](code_of_conduct.md) 
<!-- badges: end -->

**EXstat.CARD** is a set of parameterization files for the banking and simplification of hydroclimatic temporal data aggregation with the [EXstat](https://github.com/super-lou/EXstat) package.

This package lists all the available CARDs and is intended to work in conjunction with EXstat. For information on how to use these CARDs, please refer to the [EXstat documentation](https://github.com/super-lou/EXstat?tab=readme-ov-file#exstat-). This documentation is intended to help advanced users create their own CARD.

This project was carried out for National Research Institute for Agriculture, Food and the Environment (Institut National de Recherche pour l’Agriculture, l’Alimentation et l’Environnement, [INRAE](https://agriculture.gouv.fr/inrae-linstitut-national-de-recherche-pour-lagriculture-lalimentation-et-lenvironnement) in french) and is at the core of [MAKAHO](https://github.com/super-lou/MAKAHO).


## Installation
For latest development version
``` 
remotes::install_github("super-lou/EXstat.CARD")
```
(which will take care of EXstat installation also)


## You need a new CARD ?
- **Good Solution** : Search existing request in the issue list and if no one has asked for it, create a new issue.
- **Better Solution** : Along with the issue submission, provide a minimal CARD file with informative metadata filled out.
- **Best Solution** : Create and test a CARD by your own and submit a pull request. This is the fastest way to get a new CARD.


## Documentation
### [inst/\_\_all\_\_](https://github.com/super-lou/EXstat.CARD/blob/main/inst/__all__)
In this directory, you can find all the different CARDs available, stored by topic. All CARDs have the same structure, as exemplified by the annual average daily flow [`QA`](https://github.com/super-lou/EXstat.CARD/blob/main/inst/__all__/Flow/Mean_Flows/serie/QA.R) in [`__all__/Flow/Mean_Flows/serie`](https://github.com/super-lou/EXstat.CARD/tree/main/inst/__all__/Flow/Mean_Flows/serie):

``` R
#   ___                _ 
#  / __| __ _  _ _  __| |
# | (__ / _` || '_|/ _` |
#  \___|\__,_||_|  \__,_|
# Copyright 2022-2025 Louis Héraut (louis.heraut@inrae.fr)*1
#
# *1   INRAE, France
#
# This file is part of EXstat.CARD R package.
#
# EXstat.CARD R package is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version.
#
# EXstat.CARD R package is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with EXstat.CARD R package.
# If not, see <https://www.gnu.org/licenses/>.


## INFO ______________________________________________________________
### English __________________________________________________________
CARD$P.variable_en = "QA"
CARD$P.unit_en = "m^{3}.s^{-1}"
CARD$P.name_en = "Annual mean daily discharge"
CARD$P.description_en = ""
CARD$P.method_en = "1. annual aggregation [09-01, 08-31] - mean"
CARD$P.sampling_period_en = "09-01, 08-31"
CARD$P.topic_en = "Flow, Mean Flows, Intensity"

### French ___________________________________________________________
CARD$P.variable_fr = "QA"
CARD$P.unit_fr = "m^{3}.s^{-1}"
CARD$P.name_fr = "Moyenne annuelle du débit journalier"
CARD$P.description_fr = ""
CARD$P.method_fr = "1. agrégation annuelle [01-09, 31-08] - moyenne"
CARD$P.sampling_period_fr = "01-09, 31-08"
CARD$P.topic_fr = "Débit, Moyennes Eaux, Intensité"

### Global ___________________________________________________________
CARD$P.preferred_hydrological_month = 9
CARD$P.is_date = FALSE
CARD$P.to_normalise = TRUE
CARD$P.palette = "#452C1A #7F4A23 #B3762A #D4B86A #EFE0B0 #BCE6DB #7ACEB9 #449C93 #2A6863 #193830"


## PROCESS ___________________________________________________________
### P1 _______________________________________________________________
CARD$P1.funct = list(QA=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.time_step = "year"
CARD$P1.sampling_period = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
```

CARDs are separated into 2 main parts: `INFO` and `PROCESS`.

##### INFO
In this part, you can find all the necessary information about the variable represented by this CARD. There are English and French versions for parameters such as the unit, the name, and the description. Global info are general info that do not need translation.

This information is not merely informational; it serves as metadata for [EXstat](https://github.com/super-lou/EXstat).

All of these parameters are optional because each of them has a default value based on the [`__default__.R`](https://github.com/super-lou/EXstat.CARD/blob/main/inst/__default__.R) CARD, which you can find in the [inst](https://github.com/super-lou/EXstat.CARD/blob/main/inst) directory. However, you are definitely encouraged to fill out most of them.

##### PROCESS
In the PROCESS part, you will find steps needed to extract the desired variable. The parameters listed here are parameters that you can use in [EXstat](https://github.com/super-lou/EXstat)'s [`process_extraction()`](https://github.com/super-lou/EXstat/blob/main/R/process_extraction.R) function. Here, there is only one step because we only need to calculate a yearly mean and no other type of aggregation. However, for example, we can add another step like:

``` R
### P2 _______________________________________________________________
CARD$P2.funct = list("meanQA"=mean)
CARD$P2.funct_args = list("QA", na.rm=TRUE)
CARD$P2.time_step = "none"
```

And that will now be the modulus of the flow, which is the average of the annual average daily flow, labeled as `meanQA`.

### [R/](https://github.com/super-lou/EXstat.CARD/tree/main/R)
In this directory, you can find all the different functions needed for the aggregation process in CARDs. They are ordered by type of application, but it may take some time to search and understand what is available or not. This is where you can modify or add your own function.

This directory also contains the core functions for [CARD management](https://github.com/super-lou/EXstat.CARD/blob/main/R/CARD_management.R) and [CARD extraction](https://github.com/super-lou/EXstat.CARD/blob/main/R/CARD_process.R), which allow users to interact with the CARD formatting in connection with the [EXstat](https://github.com/super-lou/EXstat) package.


## Code of Conduct
Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
