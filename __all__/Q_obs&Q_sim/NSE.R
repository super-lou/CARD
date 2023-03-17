CARD$P.var = "NSE"
CARD$P.unit = ""
CARD$P.glose = "Coeffcient d'efficacité de Nash-Sutcliffe"
CARD$P.topic = c("Performance", "NSE")

CARD$P1.funct = list(NSE=compute_NSE)
CARD$P1.funct_args = list("Q_obs", "Q_sim")
CARD$P1.timeStep = "none"
CARD$P1.NAyear_lim = 10
