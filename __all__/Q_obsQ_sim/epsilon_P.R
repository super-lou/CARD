CARD$P.var = "epsilon_{P}"
CARD$P.unit = ""
CARD$P.glose = "Élasticité annuelle du débit aux précipitations"
CARD$P.topic = "Sensibilité à la variabilité climatique"
CARD$P.samplePeriod = "Mois du minimum des débits mensuels"
    
CARD$P1.funct = list(QA_obs=mean,
                      QA_sim=mean,
                      PA=mean)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE),
                           list("Pl", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = list(min, list("Q_obs", na.rm=TRUE))
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("epsilon_{P}_obs"=compute_elasticity,
                      "epsilon_{P}_sim"=compute_elasticity)
CARD$P2.funct_args = list(list(Q="QA_obs", X="PA"),
                           list(Q="QA_sim", X="PA"))
CARD$P2.timeStep = "none"
