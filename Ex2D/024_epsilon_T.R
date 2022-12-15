ASHES$P.var = "epsilon_{T}"
ASHES$P.unit = ""
ASHES$P.glose = "Élasticité annuelle du débit aux températures"
ASHES$P.topic = "Sensibilité au climat"
ASHES$P.samplePeriod = '09-01'
    
ASHES$P1.funct = list(QA_obs=mean,
                      QA_sim=mean,
                      TA=mean)
ASHES$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE),
                           list("T", na.rm=TRUE))
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list("epsilon_{T}_obs"=compute_elasticity,
                      "epsilon_{T}_sim"=compute_elasticity)
ASHES$P2.funct_args = list(list(Q="QA_obs", X="TA"),
                           list(Q="QA_sim", X="TA"))
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
