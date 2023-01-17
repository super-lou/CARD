CARD$P.var = "KGEsqrt"
CARD$P.unit = ""
CARD$P.glose = "Coeffcient d'efficacité de Kling-Gupta de la racine carrée des données"
CARD$P.topic = c("Performance", "KGE")

CARD$P1.funct = list(KGEsqrt=compute_KGEsqrt)
CARD$P1.funct_args = list("Q_obs", "Q_sim")
CARD$P1.timeStep = "none"
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10
