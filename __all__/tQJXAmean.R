ASHES$P.var = "tQJXAmean"
ASHES$P.unit = "jour de l'année"
ASHES$P.glose = "Moyenne des dates maximums annuels des débits journaliers"
ASHES$P.event = "Crue"
ASHES$P.samplePeriod = '09-01'

ASHES$P1.funct = list(tQJXA=which.maxNA)
ASHES$P1.funct_args = list("Q", na.rm=TRUE)
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.isDate = TRUE
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list(tQJXAmean=mean)
ASHES$P2.funct_args = list("tQJXA", na.rm=TRUE)
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10
ASHES$P2.rmNApct = FALSE
