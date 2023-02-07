CARD$P.var = "Biais"
CARD$P.unit = ""
CARD$P.glose = "Différence relative adimensionnée entre les données simulées et observées"
CARD$P.topic = c("Performance", "Biais")

CARD$P1.funct = list(Biais=compute_Biais)
CARD$P1.funct_args = list("Q_obs", "Q_sim")
CARD$P1.timeStep = "none"
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10
