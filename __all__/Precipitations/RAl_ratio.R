CARD$P.variable = "RAl_ratio"
CARD$P.unit = ""
CARD$P.is_date = FALSE
CARD$P.is_normalize = FALSE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"
CARD$P.glose = "Ratio des précipitations annuelles liquides sur les précipitations annuelles totales"
CARD$P.topic = c("Précipitations", "Modérée")
CARD$P.sampling_period = "09-01"

CARD$P1.funct = list(RA=sumNA,
                     RAl=sumNA)
CARD$P1.funct_args = list(list("R", na.rm=TRUE),
                          list("Rl", na.rm=TRUE))
CARD$P1.time_step = "year"
CARD$P1.sampling_period = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(RAl_ratio=divided)
CARD$P2.funct_args = list("RAl", "RA")
CARD$P2.time_step = "year"
