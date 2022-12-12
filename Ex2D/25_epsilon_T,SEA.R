ASHES$P.var = "epsilon_T,SEA"
ASHES$P.unit = ""
ASHES$P.glose = "Élasticités saisonnières du débit aux températures"
ASHES$P.event = "model"
ASHES$P.samplePeriod = '09-01'
    
ASHES$P1.funct = list(QA_SEA_obs=mean,
                      QA_SEA_sim=mean,
                      TA_SEA=mean)
ASHES$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE),
                           list("T", na.rm=TRUE))
ASHES$P1.timeStep = "year-season"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
ASHES$P1.onlyDate4Season = TRUE

ASHES$P2.funct = list("epsilon_{T,SEA}_obs"=compute_elasticity,
                      "epsilon_{T,SEA}_sim"=compute_elasticity)
ASHES$P2.funct_args = list(list(Q="QA_SEA_obs", X="TA_SEA"),
                           list(Q="QA_SEA_sim", X="TA_SEA"))
ASHES$P2.timeStep = "season"
ASHES$P2.NApct_lim = 20
ASHES$P2.Seasons = c("DJF", "MAM", "JJA", "SON")
ASHES$P2.compress = TRUE
