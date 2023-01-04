CARD$P.var = "RAT_ET0"
CARD$P.unit = "bool"
CARD$P.glose = "Robustness Assessment Test pour l'évapotranspiration de référence"
CARD$P.topic = c("Climat", "Sensibilité au climat")
CARD$P.samplePeriod = '09-01'

CARD$P1.funct = list(BiasA=compute_Bias,
                      ET0A=mean)
CARD$P1.funct_args = list(list("Q_obs", "Q_sim"),
                           list("ET0", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = '09-01'
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(RAT_ET0=compute_RAT_X)
CARD$P2.funct_args = list("BiasA", "ET0A", thresh=0.05)
CARD$P2.timeStep = "none"
CARD$P2.NApct_lim = 20
