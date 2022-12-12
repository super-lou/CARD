ASHES$P.var = "epsilon_P"
ASHES$P.unit = ""
ASHES$P.glose = "Élasticité annuelle du débit aux précipitations"
ASHES$P.event = "model"
ASHES$P.samplePeriod = '09-01'
    
ASHES$P1.funct = list(QA_obs=mean,
                      QA_sim=mean,
                      PA=mean)
ASHES$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE),
                           list("Pl", na.rm=TRUE))
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list("epsilon_{P}_obs"=compute_elasticity,
                      "epsilon_{P}_sim"=compute_elasticity)
ASHES$P2.funct_args = list(list(Q="QA_obs", X="PA"),
                           list(Q="QA_sim", X="PA"))
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
