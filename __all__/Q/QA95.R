CARD$P.var = "QA95"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Débit seuil annuel avec une probabilité de dépassement de 95% (centile 5%)"
CARD$P.topic = "Basses Eaux"
CARD$P.samplePeriod = "Mois du maximum des débits mensuels"
    
CARD$P1.funct = list(QA95=compute_Qp)
CARD$P1.funct_args = list("Q", p=0.9)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = list(max, list("Q", na.rm=TRUE))
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
