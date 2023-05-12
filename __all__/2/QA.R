CARD$P.var = "QA"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Moyenne annuelle du débit journalier"
CARD$P.topic = "Moyennes Eaux"
CARD$P.samplePeriod = "09-01"

CARD$P1.funct = list(QA_obs=mean,
                     QA_sim=mean)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                          list("Q_sim", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
