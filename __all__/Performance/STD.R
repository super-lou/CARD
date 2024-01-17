CARD$P.variable = "STD"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = NULL
CARD$P.glose = "Écart-type des débits journaliers"
CARD$P.topic = c("Débit", "Performance")

CARD$P1.funct = list(STD=compute_STD)
CARD$P1.funct_args = list("Q_obs", "Q_sim", na.rm=TRUE)
CARD$P1.time_step = "none"
CARD$P1.NAyear_lim = 10
