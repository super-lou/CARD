ASHES$P.var = "median{tQJXA}"
ASHES$P.unit = "jour de l'année"
ASHES$P.glose = "Mediane des dates maximums annuels des débits journaliers"
ASHES$P.topic = c("Liés à une statistique", "Crue")
ASHES$P.samplePeriod = '09-01'

ASHES$P1.funct = list(tQJXA_obs=which.maxNA,
                      tQJXA_sim=which.maxNA)
ASHES$P1.funct_args = list(list("Q_obs"),
                           list("Q_sim"))
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.isDate = TRUE
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list("median{tQJXA}_obs"=circular_median,
                      "median{tQJXA}_sim"=circular_median)
ASHES$P2.funct_args = list(list("tQJXA_obs", period=365.25, na.rm=TRUE),
                           list("tQJXA_sim", period=365.25, na.rm=TRUE))
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
