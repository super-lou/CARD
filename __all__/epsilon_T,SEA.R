ASHES$P.var = "epsilon_T,SEA"
ASHES$P.unit = ""
ASHES$P.glose = "Élasticités saisonnières du débit aux températures"
ASHES$P.event = "model"
ASHES$P.samplePeriod = '09-01'
    
ASHES$P1.funct = list(QA=mean, TA=mean)
ASHES$P1.funct_args = list(list("Q", na.rm=TRUE),
                           list("T", na.rm=TRUE))
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list(epsilon_T=compute_elasticity)
ASHES$P2.funct_args = list(Q="QA", X="TA")
ASHES$P2.timeStep = "season"
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10
ASHES$P2.Seasons = c("DJF", "MAM", "JJA", "SON")
ASHES$P2.compress = TRUE
