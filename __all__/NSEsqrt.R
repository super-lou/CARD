CARD$P.var = "NSEsqrt"
CARD$P.unit = ""
CARD$P.glose = "Coeffcient d'efficacité de Nash-Sutcliffe de la racine carrée des données"
CARD$P.topic = c("Performance", "NSE")

CARD$P1.funct = list(NSEsqrt=compute_NSEsqrt)
CARD$P1.funct_args = list("Q_obs", "Q_sim")
CARD$P1.timeStep = "none"
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10
