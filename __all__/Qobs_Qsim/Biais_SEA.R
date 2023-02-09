CARD$P.var = "Biais_SEA"
CARD$P.unit = ""
CARD$P.glose = "Différence relative adimensionnée entre les données saisonnières simulées et observées"
CARD$P.topic = c("Performance", "Biais")

CARD$P1.funct = list(Biais_SEA=compute_Biais)
CARD$P1.funct_args = list("Q_obs", "Q_sim")
CARD$P1.timeStep = "season"
CARD$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
CARD$P1.compress = TRUE
