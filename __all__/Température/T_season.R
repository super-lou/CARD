CARD$P.var = c("T_DJF", "T_MAM", "T_JJA", "T_SON")
CARD$P.unit = "°C"
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.palette = "#053061 #2166AC #4393C3 #92C5DE #D1E5F0 #FDDBC7 #F4A582 #D6604D #B2182B #67001F"
CARD$P.glose = c("Température hivernales", "Température printanières",
                 "Température estivales", "Température automnales")
CARD$P.topic = c("Température", "Moyenne")

CARD$P1.funct = list(T=mean)
CARD$P1.funct_args = list("T", na.rm=TRUE)
CARD$P1.timeStep = "season"
CARD$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE
