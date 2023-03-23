CARD$P.var = "QA_MON"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Débit moyen mensuel annuel"
CARD$P.topic = "Moyennes Eaux"

CARD$P1.funct = list(QA_MON=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.timeStep = "year-month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
