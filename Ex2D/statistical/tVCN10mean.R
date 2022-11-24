ASHES$P.var = "tVCN10mean"
ASHES$P.unit = "jour de l'année"
ASHES$P.glose = "Moyenne des dates des minimums annuels de la moyenne sur 10 jours du débit journalier"
ASHES$P.event = "Étiage"

ASHES$P1.funct = list(VC10=rollmean_center)
ASHES$P1.funct_args = list("Q", k=10)
ASHES$P1.timeStep = "none"
ASHES$P1.keep = TRUE

ASHES$P2.funct = list(tVCN10=which.minNA)
ASHES$P2.funct_args = list("VC10", na.rm=TRUE)
ASHES$P2.timeStep = "year"
ASHES$P2.samplePeriod = c('05-01', '11-30')
ASHES$P2.isDate = TRUE
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10

ASHES$P3.funct = list(tVCN10mean=mean)
ASHES$P3.funct_args = list("tVCN10", na.rm=TRUE)
ASHES$P3.timeStep = "none"
ASHES$P3.NApct_lim = 20
ASHES$P3.NAyear_lim = 10
ASHES$P3.rmNApct = FALSE
