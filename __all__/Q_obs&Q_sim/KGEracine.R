CARD$P.var = "KGEracine"
CARD$P.unit = ""
CARD$P.glose = "Coeffcient d'efficacité de Kling-Gupta de la racine carrée des données"
CARD$P.topic = c("Performance", "KGE")

CARD$P1.funct = list(KGEracine=compute_KGEracine)
CARD$P1.funct_args = list("Q_obs", "Q_sim")
CARD$P1.timeStep = "none"
CARD$P1.NAyear_lim = 10
