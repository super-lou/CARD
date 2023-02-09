CARD$P.var = "NSEinv"
CARD$P.unit = ""
CARD$P.glose = "Coeffcient d'efficacité de Nash-Sutcliffe de l'inverse des données"
CARD$P.topic = c("Performance", "NSE")

CARD$P1.funct = list(NSEinv=compute_NSEi)
CARD$P1.funct_args = list("Q_obs", "Q_sim")
CARD$P1.timeStep = "none"
