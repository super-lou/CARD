CARD$P.var = "alphaCDC"
CARD$P.unit = "sans unité"
CARD$P.glose = "Pente du segment entre les quantiles des débits journaliers à 33 % et 66 % de la courbe des débits classés"
CARD$P.topic = c("Moyennes Eaux", "Signature hydrologique")

CARD$P1.funct = list(alphaCDC=fdc_slope)
CARD$P1.funct_args = list("Q", p=c(0.33, 0.66))
CARD$P1.timeStep = "none"
CARD$P1.NAyear_lim = 10
