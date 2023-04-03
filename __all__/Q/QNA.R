CARD$P.var = "QNA"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Minimum annuel du débit journalier"
CARD$P.topic = "Basses Eaux"
CARD$P.samplePeriod = c("05-01", "11-30")
    
CARD$P1.funct = list(QNA=minNA)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = c("05-01", "11-30")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
