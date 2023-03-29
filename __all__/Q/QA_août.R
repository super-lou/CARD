CARD$P.var = "QA_août"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Moyenne des débits journaliers de chaque mois d'août"
CARD$P.topic = "Moyennes Eaux"
CARD$P.samplePeriod = c("08-01", "08-31")
    
CARD$P1.funct = list("QA_août"=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = c("08-01", "08-31")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
