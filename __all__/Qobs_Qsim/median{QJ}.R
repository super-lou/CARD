CARD$P.var = "median{QJ}"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Débit median inter-annuel"
CARD$P.topic = "Moyennes Eaux"
    
CARD$P1.funct = list("median{QJ}_obs"=median,
                     "median{QJ}_sim"=median)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                          list("Q_sim", na.rm=TRUE))
CARD$P1.timeStep = "yearday"
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10
