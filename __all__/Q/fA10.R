CARD$P.var = "fA10"
CARD$P.unit = "jour.an^{-1}"
CARD$P.glose = "Fréquence annuelle de dépassement (Q > Q10)"
CARD$P.topic = "Hautes Eaux"
CARD$P.samplePeriod = "Mois du minimum des débits mensuels"
    
CARD$P1.funct = list(lowLim=compute_Qp)
CARD$P1.funct_args = list("Q", p=0.1)
CARD$P1.timeStep = "none"
CARD$P1.NApct_lim = NULL
CARD$P1.NAyear_lim = 10
CARD$P1.keep = "all"

CARD$P2.funct = list(fA10=compute_fAp)
CARD$P2.funct_args = list("Q", lowLim="lowLim")
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = list(min, list("Q", na.rm=TRUE))
CARD$P2.NApct_lim = 3

