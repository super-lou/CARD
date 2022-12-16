ASHES$P.var = "median{tVCN10}"
ASHES$P.unit = "jour de l'année"
ASHES$P.glose = "Mediane des dates des minimums annuels de la moyenne sur 10 jours du débit journalier"
ASHES$P.topic = c("Étiage", "Liés à une statistique")
ASHES$P.samplePeriod = c('05-01', '11-30')
    
ASHES$P1.funct = list(VC10_obs=rollmean_center,
                      VC10_sim=rollmean_center)
ASHES$P1.funct_args = list(list("Q_obs", k=10),
                           list("Q_sim", k=10))
ASHES$P1.timeStep = "none"
ASHES$P1.keep = TRUE

ASHES$P2.funct = list(tVCN10_obs=which.minNA,
                      tVCN10_sim=which.minNA)
ASHES$P2.funct_args = list(list("VC10_obs"),
                           list("VC10_sim"))
ASHES$P2.timeStep = "year"
ASHES$P2.samplePeriod = c('05-01', '11-30')
ASHES$P2.isDate = TRUE
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10

ASHES$P3.funct = list("median{tVCN10}_obs"=circular_median,
                      "median{tVCN10}_sim"=circular_median)
ASHES$P3.funct_args = list(list("tVCN10_obs", period=365.25, na.rm=TRUE),
                           list("tVCN10_sim", period=365.25, na.rm=TRUE))
ASHES$P3.timeStep = "none"
ASHES$P3.NApct_lim = 20
