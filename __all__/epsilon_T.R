CARD$P.var = "epsilon_{T}"
CARD$P.unit = ""
CARD$P.glose = "Élasticité annuelle du débit aux températures"
CARD$P.topic = c("Climat", "Sensibilité à la variabilité climatique")
CARD$P.samplePeriod = '09-01'
    
CARD$P1.funct = list(QA_obs=mean,
                      QA_sim=mean,
                      TA=mean)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE),
                           list("T", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = '09-01'
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("epsilon_{T}_obs"=compute_elasticity,
                      "epsilon_{T}_sim"=compute_elasticity)
CARD$P2.funct_args = list(list(Q="QA_obs", X="TA"),
                           list(Q="QA_sim", X="TA"))
CARD$P2.timeStep = "none"
CARD$P2.NApct_lim = 20
