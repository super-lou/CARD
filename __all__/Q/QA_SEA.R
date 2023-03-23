CARD$P.var = "QA_SEA"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Débit saisonnier annuel"
CARD$P.topic = c("Moyennes Eaux", "Liés à une statistique")

CARD$P1.funct = list(QA_SEA=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.timeStep = "season"
CARD$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
CARD$P1.compress = TRUE
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
