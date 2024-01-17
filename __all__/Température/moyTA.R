CARD$P.variable = "moyTA"
CARD$P.unit = "°C"
CARD$P.is_date = FALSE
CARD$P.is_normalize = FALSE
CARD$P.palette = "#053061 #2166AC #4393C3 #92C5DE #D1E5F0 #FDDBC7 #F4A582 #D6604D #B2182B #67001F"
CARD$P.glose = "Moyenne des températures moyennes annuelles"
CARD$P.topic = c("Température", "Moyenne")
CARD$P.sampling_period = "09-01"

CARD$P1.funct = list(TA=mean)
CARD$P1.funct_args = list("T", na.rm=TRUE)
CARD$P1.time_step = "year"
CARD$P1.sampling_period = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(moyTA=mean)
CARD$P2.funct_args = list("TA", na.rm=TRUE)
CARD$P2.time_step = "none"
