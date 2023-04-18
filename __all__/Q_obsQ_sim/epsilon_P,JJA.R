CARD$P.var = "epsilon_{P,JJA}"
CARD$P.unit = ""
CARD$P.glose = "Élasticités estivales du débit aux précipitations"
CARD$P.topic = "Sensibilité à la variabilité climatique"
CARD$P.samplePeriod = c("06-01", "08-31")

CARD$P1.funct = list(QA_JJA_obs=mean,
                     QA_JJA_sim=mean,
                     PA_JJA=mean)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                          list("Q_sim", na.rm=TRUE),
                          list("Pl", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = c("06-01", "08-31")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("epsilon_{P,JJA}_obs"=compute_elasticity,
                     "epsilon_{P,JJA}_sim"=compute_elasticity)
CARD$P2.funct_args = list(list(Q="QA_JJA_obs", X="PA_JJA"),
                          list(Q="QA_JJA_sim", X="PA_JJA"))
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = c("06-01", "08-31")
CARD$P2.NApct_lim = 3
