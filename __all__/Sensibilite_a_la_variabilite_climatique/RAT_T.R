CARD$P.variable = "RAT_T"
CARD$P.unit = "bool"
CARD$P.is_date = FALSE
CARD$P.is_normalize = FALSE
CARD$P.palette = NULL
CARD$P.glose = "Test de robustesse à une variation de température"
CARD$P.topic = c("Température/Débit", "Sensibilité à la variabilité climatique")
CARD$P.sampling_period = "09-01"

CARD$P1.funct = list(BiaisA=compute_Biais,
                     TA=mean)
CARD$P1.funct_args = list(list("Q_obs", "Q_sim"),
                          list("T_obs", na.rm=TRUE))
CARD$P1.time_step = "year"
CARD$P1.sampling_period = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(RAT_T=compute_RAT_X)
CARD$P2.funct_args = list("BiaisA", "TA", thresh=0.05)
CARD$P2.time_step = "none"
