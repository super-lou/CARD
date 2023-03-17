CARD$P.var = "RAT_T"
CARD$P.unit = "bool"
CARD$P.glose = "Robustness Assessment Test pour la température"
CARD$P.topic = "Sensibilité à la variabilité climatique"
CARD$P.samplePeriod = "Mois du minimum des débits mensuels"

CARD$P1.funct = list(BiaisA=compute_Biais,
                     TA=mean)
CARD$P1.funct_args = list(list("Q_obs", "Q_sim"),
                           list("T", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = list(min, list("Q_obs", na.rm=TRUE))
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(RAT_T=compute_RAT_X)
CARD$P2.funct_args = list("BiaisA", "TA", thresh=0.05)
CARD$P2.timeStep = "none"
