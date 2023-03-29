CARD$P.var = "QA_juill"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Moyenne des débits journaliers de chaque mois de juillet"
CARD$P.topic = "Moyennes Eaux"
CARD$P.samplePeriod = c("07-01", "07-31")
    
CARD$P1.funct = list(QA_juill=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = c("07-01", "07-31")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
