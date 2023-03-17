CARD$P.var = "median{QJ}C5"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Débit median inter-annuel lissé sur 5 jours"
CARD$P.topic = "Moyennes Eaux"
    
CARD$P1.funct = list("median{QJ}_obs"=median,
                     "median{QJ}_sim"=median)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                          list("Q_sim", na.rm=TRUE))
CARD$P1.timeStep = "yearday"
CARD$P1.keep = "all"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("median{QJ}C5_obs"=rollmean_center,
                     "median{QJ}C5_sim"=rollmean_center)
CARD$P2.funct_args = list(list("median{QJ}_obs", k=5, isCyclical=TRUE),
                          list("median{QJ}_sim", k=5, isCyclical=TRUE))
CARD$P2.timeStep = "none"
CARD$P2.period = NULL
CARD$P2.keep = c("Yearday", "median{QJ}C5_obs", "median{QJ}C5_sim")
