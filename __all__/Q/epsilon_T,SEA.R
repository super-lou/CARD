CARD$P.var = "epsilon_{T,SEA}"
CARD$P.unit = ""
CARD$P.glose = "Élasticités saisonnières du débit aux températures"
CARD$P.topic = "Sensibilité à la variabilité climatique"
    
CARD$P1.funct = list(QA_SEA=mean,
                     TA_SEA=mean)
CARD$P1.funct_args = list(list("Q", na.rm=TRUE),
                          list("T", na.rm=TRUE))
CARD$P1.timeStep = "year-season"
CARD$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
CARD$P1.onlyDate4Season = TRUE
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("epsilon_{T,SEA}"=compute_elasticity)
CARD$P2.funct_args = list(Q="QA_SEA", X="TA_SEA")
CARD$P2.timeStep = "season"
CARD$P2.Seasons = c("DJF", "MAM", "JJA", "SON")
CARD$P2.compress = TRUE
CARD$P2.NApct_lim = 3
