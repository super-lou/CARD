CARD$P.var = "median{tQJXA}"
CARD$P.unit = "jour de l'année"
CARD$P.glose = "Mediane des dates maximums annuels des débits journaliers"
CARD$P.topic = c("Hautes Eaux", "Liés à une statistique")
CARD$P.samplePeriod = "Mois du minimum des débits mensuels"

CARD$P1.funct = list(tQJXA_obs=which.maxNA,
                      tQJXA_sim=which.maxNA)
CARD$P1.funct_args = list(list("Q_obs"),
                           list("Q_sim"))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = list(min, list("Q_obs", na.rm=TRUE))
CARD$P1.isDate = TRUE

CARD$P2.funct = list("median{tQJXA}_obs"=circular_median,
                      "median{tQJXA}_sim"=circular_median)
CARD$P2.funct_args = list(list("tQJXA_obs", periodicity=365.25, na.rm=TRUE),
                           list("tQJXA_sim", periodicity=365.25, na.rm=TRUE))
CARD$P2.timeStep = "none"
