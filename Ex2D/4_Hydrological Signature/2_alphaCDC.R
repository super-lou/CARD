ASHES$P.var = "alphaCDC"
ASHES$P.unit = ""
ASHES$P.glose = "Pente du segment entre les quantiles des débits journaliers à 33 % et 66 % de la courbe des débits classés"
ASHES$P.event = "model"

ASHES$P1.funct = list(alphaCDC=fdc_slope)
ASHES$P1.funct_args = list("Q", probs=c(0.33, 0.66))
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.rmNApct = FALSE
