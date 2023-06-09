CARD$P.var = "medQJC5"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Débit median inter-annuel lissé sur 5 jours"
CARD$P.topic = "Moyennes Eaux"
    
CARD$P1.funct = list("medQJ"=median)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.timeStep = "yearday"
CARD$P1.keep = "all"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("medQJC5"=rollmean_center)
CARD$P2.funct_args = list("medQJ", k=5, isCyclical=TRUE)
CARD$P2.timeStep = "none"
CARD$P2.period = NULL
CARD$P2.keep = c("Yearday", "medQJC5")
