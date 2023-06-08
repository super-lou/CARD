CARD$P.var = "tVCN10"
CARD$P.unit = "jour de l'année"
CARD$P.glose = "Date du minimum annuel de la moyenne sur 10 jours du débit journalier (centre d'étiage)"
CARD$P.topic = "Basses Eaux"
CARD$P.samplePeriod = c("05-01", "11-30")
    
CARD$P1.funct = list(VC10=rollmean_center)
CARD$P1.funct_args = list("Q", k=10)
CARD$P1.timeStep = "none"
CARD$P1.keep = "all"

CARD$P2.funct = list(tCEN_etiage=which.minNA)
CARD$P2.funct_args = list("VC10")
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = c("05-01", "11-30")
CARD$P2.isDate = TRUE
CARD$P2.NApct_lim = 3
CARD$P2.NAyear_lim = 10
