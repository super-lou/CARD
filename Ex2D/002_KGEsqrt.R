ASHES$P.var = "KGEsqrt"
ASHES$P.unit = ""
ASHES$P.glose = "Coeffcient d'efficacité de Kling-Gupta de la racine carrée des données"
ASHES$P.topic = c("Performance", "KGE")

ASHES$P1.funct = list(KGEsqrt=compute_KGEsqrt)
ASHES$P1.funct_args = list("Q_obs", "Q_sim")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
