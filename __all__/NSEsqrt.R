ASHES$P.var = "NSEsqrt"
ASHES$P.unit = ""
ASHES$P.glose = "Coeffcient d'efficacité de Nash-Sutcliffe de la racine carrée des données"
ASHES$P.topic = c("Performance", "NSE")

ASHES$P1.funct = list(NSEsqrt=compute_NSEsqrt)
ASHES$P1.funct_args = list("Q_obs", "Q_sim")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
