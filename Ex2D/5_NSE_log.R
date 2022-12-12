ASHES$P.var = "NSE_log"
ASHES$P.unit = ""
ASHES$P.glose = "Coeffcient d'efficacité de Nash-Sutcliffe du logarithme des données"
ASHES$P.event = "model"

ASHES$P1.funct = list(NSElog=compute_NSElog)
ASHES$P1.funct_args = list("Q_obs", "Q_sim")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
