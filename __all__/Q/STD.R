CARD$P.var = "STD"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Écart-type des débits journaliers"
CARD$P.topic = c("Performance")

CARD$P1.funct = list(STD=sd)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.timeStep = "none"
CARD$P1.NAyear_lim = 10
