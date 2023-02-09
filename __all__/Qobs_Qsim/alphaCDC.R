CARD$P.var = "alphaCDC"
CARD$P.unit = ""
CARD$P.glose = "Pente du segment entre les quantiles des débits journaliers à 33 % et 66 % de la courbe des débits topicés"
CARD$P.topic = c("Moyennes Eaux", "Signature hydrologique")

CARD$P1.funct = list(alphaCDC_obs=fdc_slope,
                      alphaCDC_sim=fdc_slope)
CARD$P1.funct_args = list(list("Q_obs", p=c(0.33, 0.66)),
                           list("Q_sim", p=c(0.33, 0.66)))
CARD$P1.timeStep = "none"
