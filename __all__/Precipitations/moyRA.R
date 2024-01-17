CARD$P.variable = "moyRA"
CARD$P.unit = "mm"
CARD$P.is_date = FALSE
CARD$P.is_normalize = FALSE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"
CARD$P.glose = "Moyenne des cumuls des précipitations totales annuelles"
CARD$P.topic = c("Précipitations", "Modérée")
CARD$P.sampling_period = "09-01"

CARD$P1.funct = list(RA=sumNA)
CARD$P1.funct_args = list("R", na.rm=TRUE)
CARD$P1.time_step = "year"
CARD$P1.sampling_period = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(moyRA=mean)
CARD$P2.funct_args = list("RA", na.rm=TRUE)
CARD$P2.time_step = "none"
