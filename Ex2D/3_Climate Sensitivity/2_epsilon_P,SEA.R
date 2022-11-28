ASHES$P.var = "epsilon_P,SEA"
ASHES$P.unit = ""
ASHES$P.glose = "Élasticités saisonnières du débit aux précipitations"
ASHES$P.event = "model"

ASHES$P1.funct = list(QA=mean, PA=mean)
ASHES$P1.funct_args = list(list("Q", na.rm=TRUE),
                           list("P", na.rm=TRUE))
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list(epsilon_P=compute_elasticity)
ASHES$P2.funct_args = list(Q="QA", X="PA")
ASHES$P2.timeStep = "season"
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10
ASHES$P2.Seasons = c("DJF", "MAM", "JJA", "SON")
ASHES$P2.rmNApct = FALSE
