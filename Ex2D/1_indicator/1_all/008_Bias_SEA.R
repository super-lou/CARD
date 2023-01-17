CARD$P.var = "Bias_SEA"
CARD$P.unit = ""
CARD$P.glose = "Différence relative adimensionnée entre les données saisonnières simulées et observées"
CARD$P.topic = c("Performance", "Bias")

CARD$P1.funct = list(Bias=compute_Bias)
CARD$P1.funct_args = list("Q_obs", "Q_sim")
CARD$P1.timeStep = "season"
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10
CARD$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
CARD$P1.compress = TRUE
