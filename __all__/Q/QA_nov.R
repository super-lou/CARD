CARD$P.var = "QA_nov"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Moyenne des débits journaliers de chaque mois de novembre"
CARD$P.topic = "Moyennes Eaux"
CARD$P.samplePeriod = c("11-01", "11-30")
    
CARD$P1.funct = list(QA_nov=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = c("11-01", "11-30")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
