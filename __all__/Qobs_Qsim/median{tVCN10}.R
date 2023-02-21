CARD$P.var = "median{tVCN10}"
CARD$P.unit = "jour de l'année"
CARD$P.glose = "Mediane des dates des minimums annuels de la moyenne sur 10 jours du débit journalier"
CARD$P.topic = c("Basses Eaux", "Liés à une statistique")
CARD$P.samplePeriod = "Mois du maximum des débits mensuels"
    
CARD$P1.funct = list(VC10_obs=rollmean_center,
                      VC10_sim=rollmean_center)
CARD$P1.funct_args = list(list("Q_obs", k=10),
                           list("Q_sim", k=10))
CARD$P1.timeStep = "none"
CARD$P1.keep = "all"

CARD$P2.funct = list(tVCN10_obs=which.minNA,
                      tVCN10_sim=which.minNA)
CARD$P2.funct_args = list(list("VC10_obs"),
                           list("VC10_sim"))
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = list(max, list("Q_obs", na.rm=TRUE))
CARD$P2.isDate = TRUE

CARD$P3.funct = list("median{tVCN10}_obs"=circular_median,
                      "median{tVCN10}_sim"=circular_median)
CARD$P3.funct_args = list(list("tVCN10_obs", periodicity=365.25, na.rm=TRUE),
                           list("tVCN10_sim", periodicity=365.25, na.rm=TRUE))
CARD$P3.timeStep = "none"
