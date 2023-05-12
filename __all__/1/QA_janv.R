CARD$P.var = "QA_janv"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Moyenne des débits journaliers de chaque mois de janvier"
CARD$P.topic = "Moyennes Eaux"
CARD$P.samplePeriod = c("01-01", "01-31")
    
CARD$P1.funct = list(QA_janv=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = c("01-01", "01-31")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
