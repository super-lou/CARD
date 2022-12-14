CARD$P.var = "RAT_P"
CARD$P.unit = "bool"
CARD$P.glose = "Robustness Assessment Test pour les précipitations"
CARD$P.topic = c("Climat", "Sensibilité au climat")
CARD$P.samplePeriod = '09-01'
    
CARD$P1.funct = list(BiasA=compute_Bias,
                      PA=mean)
CARD$P1.funct_args = list(list("Q_obs", "Q_sim"),
                           list("Pl", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = '09-01'
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(RAT_P=compute_RAT_X)
CARD$P2.funct_args = list("BiasA", "PA", thresh=0.05)
CARD$P2.timeStep = "none"
CARD$P2.NApct_lim = 20
