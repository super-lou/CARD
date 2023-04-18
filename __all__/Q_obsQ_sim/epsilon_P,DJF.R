CARD$P.var = "epsilon_{P,DJF}"
CARD$P.unit = ""
CARD$P.glose = "Élasticités hivernales du débit aux précipitations"
CARD$P.topic = "Sensibilité à la variabilité climatique"
CARD$P.samplePeriod = c("12-01", "02-28")

CARD$P1.funct = list(QA_DJF_obs=mean,
                     QA_DJF_sim=mean,
                     PA_DJF=mean)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                          list("Q_sim", na.rm=TRUE),
                          list("Pl", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = c("12-01", "02-28")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("epsilon_{P,DJF}_obs"=compute_elasticity,
                     "epsilon_{P,DJF}_sim"=compute_elasticity)
CARD$P2.funct_args = list(list(Q="QA_DJF_obs", X="PA_DJF"),
                          list(Q="QA_DJF_sim", X="PA_DJF"))
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = c("12-01", "02-28")
CARD$P2.NApct_lim = 3
