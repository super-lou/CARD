ASHES$P.var = "Bias"
ASHES$P.unit = ""
ASHES$P.glose = "Différence relative adimensionnée entre les données simulées et observées"
ASHES$P.topic = c("Performance", "Bias")

ASHES$P1.funct = list(Bias=compute_Bias)
ASHES$P1.funct_args = list("Q_obs", "Q_sim")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
