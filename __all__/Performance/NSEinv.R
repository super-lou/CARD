CARD$P.variable = "NSEinv"
CARD$P.unit = "sans unité"
CARD$P.is_date = FALSE
CARD$P.is_normalize = FALSE
CARD$P.palette = NULL
CARD$P.glose = "Coeffcient d'efficacité de Nash-Sutcliffe de l'inverse des données"
CARD$P.topic = c("Débit", "Performance", "NSE")

CARD$P1.funct = list(NSEinv=compute_NSEi)
CARD$P1.funct_args = list("Q_obs", "Q_sim")
CARD$P1.time_step = "none"
CARD$P1.NAyear_lim = 10
