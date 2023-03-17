CARD$P.var = "median{QJ}"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Débit median inter-annuel"
CARD$P.topic = "Moyennes Eaux"
    
CARD$P1.funct = list("median{QJ}"=median)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.timeStep = "yearday"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
