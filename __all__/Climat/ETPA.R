!!CARD$P.var = "ETPA"
CARD$P.unit = "mm"
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Cumul des évapotranspirations annuelles"
CARD$P.topic = c("Évapotranspiration", "Moyenne")
CARD$P.samplePeriod = "09-01"

CARD$P1.funct = list(ETPA=sum)
CARD$P1.funct_args = list("ETP", na.rm=TRUE)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
