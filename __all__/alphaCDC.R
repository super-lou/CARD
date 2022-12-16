ASHES$P.var = "alphaCDC"
ASHES$P.unit = ""
ASHES$P.glose = "Pente du segment entre les quantiles des débits journaliers à 33 % et 66 % de la courbe des débits topicés"
ASHES$P.topic = c("Moyennes Eaux", "Signature hydrologique")

ASHES$P1.funct = list(alphaCDC_obs=fdc_slope,
                      alphaCDC_sim=fdc_slope)
ASHES$P1.funct_args = list(list("Q_obs", p=c(0.33, 0.66)),
                           list("Q_sim", p=c(0.33, 0.66)))
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
