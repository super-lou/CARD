ASHES$P.var = "NSE_i"
ASHES$P.unit = ""
ASHES$P.glose = "Coeffcient d'efficacité de Nash-Sutcliffe de l'inverse des données"
ASHES$P.topic = "Performance"

ASHES$P1.funct = list(NSEi=compute_NSEi)
ASHES$P1.funct_args = list("Q_obs", "Q_sim")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
