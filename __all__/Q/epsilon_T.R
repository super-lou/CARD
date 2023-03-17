CARD$P.var = "epsilon_{T}"
CARD$P.unit = ""
CARD$P.glose = "Élasticité annuelle du débit aux températures"
CARD$P.topic = "Sensibilité à la variabilité climatique"
CARD$P.samplePeriod = "Mois du minimum des débits mensuels"
    
CARD$P1.funct = list(QA=mean,
                     TA=mean)
CARD$P1.funct_args = list(list("Q", na.rm=TRUE),
                          list("T", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = list(min, list("Q", na.rm=TRUE))
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("epsilon_{T}"=compute_elasticity)
CARD$P2.funct_args = list(Q="QA", X="TA")
CARD$P2.timeStep = "none"
