CARD$P.var = "NSElog"
CARD$P.unit = ""
CARD$P.glose = "Coeffcient d'efficacité de Nash-Sutcliffe du logarithme des données"
CARD$P.topic = c("Performance", "NSE")

CARD$P1.funct = list(NSElog=compute_NSElog)
CARD$P1.funct_args = list("Q_obs", "Q_sim")
CARD$P1.timeStep = "none"
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10
