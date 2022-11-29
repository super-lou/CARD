ASHES$P.var = "BiasSEA"
ASHES$P.unit = ""
ASHES$P.glose = "Différence relative adimensionnée entre les données saisonnières simulées et observées"
ASHES$P.event = "model"

ASHES$P1.funct = list(Bias=compute_Bias)
ASHES$P1.funct_args = list("Qobs", "Qsim")
ASHES$P1.timeStep = "season"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
ASHES$P1.compress = TRUE
