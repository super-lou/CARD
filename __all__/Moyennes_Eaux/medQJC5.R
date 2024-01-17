CARD$P.variable = "medQJC5"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = NULL
CARD$P.glose = "Débit median inter-annuel lissé sur 5 jours"
CARD$P.topic = c("Débit", "Moyennes Eaux")
    
CARD$P1.funct = list("medQJ"=median)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.time_step = "yearday"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("medQJC5"=rollmean_center)
CARD$P2.funct_args = list("medQJ", k=5, isCyclical=TRUE)
CARD$P2.time_step = "none"
CARD$P2.keep = "all"
