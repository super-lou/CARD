CARD$P.variable = "dtCWDA"
CARD$P.unit = "jour"
CARD$P.is_date = FALSE
CARD$P.is_normalize = FALSE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"
CARD$P.glose = "Nombre maximal de jours consécutifs dans l'année avec au moins 1 mm de précipitation"
CARD$P.topic = c("Précipitations", "Faibles")
CARD$P.sampling_period = "09-01"

CARD$P1.funct = list(dtCWDA=apply_threshold)
CARD$P1.funct_args = list("R", lim=1,
                          where=">=",
                          what="length",
                          select="longest")
CARD$P1.time_step = "year"
CARD$P1.sampling_period = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
