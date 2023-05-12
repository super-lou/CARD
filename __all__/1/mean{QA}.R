CARD$P.var = "mean{QA}"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Moyenne inter-annuelle des moyennes intra-annuelles des débits journaliers"
CARD$P.topic = c("Moyennes Eaux", "Liés à une statistique")
CARD$P.samplePeriod = "09-01"

CARD$P1.funct = list(QA=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("mean{QA}"=mean)
CARD$P2.funct_args = list("QA", na.rm=TRUE)
CARD$P2.timeStep = "none"
