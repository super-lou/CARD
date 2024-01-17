CARD$P.variable = "epsilon_T"
CARD$P.unit = "sans unité"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = NULL
CARD$P.glose = "Élasticité annuelle du débit aux températures"
CARD$P.topic = c("Température/Débit", "Sensibilité à la variabilité climatique")
CARD$P.sampling_period = "Mois du minimum des débits mensuels"
    
CARD$P1.funct = list(QA=mean,
                     TA=mean)
CARD$P1.funct_args = list(list("Q", na.rm=TRUE),
                          list("T", na.rm=TRUE))
CARD$P1.time_step = "year"
CARD$P1.sampling_period = list(min, list("Q", na.rm=TRUE))
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("epsilon_T"=compute_elasticity)
CARD$P2.funct_args = list(Q="QA", X="TA")
CARD$P2.time_step = "none"
