ASHES$P.var = "RAT_T"
ASHES$P.unit = "bool"
ASHES$P.glose = "Robustness Assessment Test pour la température"
ASHES$P.topic = "Sensibilité au climat"
ASHES$P.samplePeriod = '09-01'
    
ASHES$P1.funct = list(BiasA=compute_Bias,
                      TA=mean)
ASHES$P1.funct_args = list(list("Q_obs", "Q_sim"),
                           list("T", na.rm=TRUE))
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list(RAT_T=compute_RAT_X)
ASHES$P2.funct_args = list("BiasA", "TA", thresh=0.05)
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
