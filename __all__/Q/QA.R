CARD$P.var = "QA"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Moyenne annuelle du débit journalier"
CARD$P.topic = "Moyennes Eaux"
CARD$P.samplePeriod = "Mois du minimum des débits mensuels"
    
CARD$P1.funct = list(QA=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = list(min, list("Q", na.rm=TRUE))
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
