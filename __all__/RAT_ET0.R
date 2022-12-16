ASHES$P.var = "RAT_ET0"
ASHES$P.unit = "bool"
ASHES$P.glose = "Robustness Assessment Test pour l'évapotranspiration de référence"
ASHES$P.topic = c("Climat", "Sensibilité au climat")
ASHES$P.samplePeriod = '09-01'

ASHES$P1.funct = list(BiasA=compute_Bias,
                      ET0A=mean)
ASHES$P1.funct_args = list(list("Q_obs", "Q_sim"),
                           list("ET0", na.rm=TRUE))
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list(RAT_ET0=compute_RAT_X)
ASHES$P2.funct_args = list("BiasA", "ET0A", thresh=0.05)
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
