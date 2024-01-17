CARD$P.variable = "aCDC"
CARD$P.unit = "sans unité"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = NULL
CARD$P.glose = "Pente du segment entre les quantiles des débits journaliers à 33 % et 66 % de la courbe des débits classés"
CARD$P.topic = c("Débit", "Moyennes Eaux", "Signature hydrologique")

CARD$P1.funct = list(aCDC=fdc_slope)
CARD$P1.funct_args = list("Q", p=c(0.33, 0.66))
CARD$P1.time_step = "none"
CARD$P1.NAyear_lim = 10
