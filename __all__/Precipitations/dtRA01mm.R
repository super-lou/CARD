CARD$P.variable = "dtRA01mm"
CARD$P.unit = "jour"
CARD$P.is_date = FALSE
CARD$P.is_normalize = FALSE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"
CARD$P.glose = "Nombre de jours pluvieux dans l'année (nombre de jours avec au moins 1 mm de précipitations)"
CARD$P.topic = c("Précipitations", "Faible")
CARD$P.sampling_period = "09-01"

CARD$P1.funct = list(dtRA01mm=apply_threshold)
CARD$P1.funct_args = list("R", lim=1,
                          where=">=",
                          what="length",
                          select="all")
CARD$P1.time_step = "year"
CARD$P1.sampling_period = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
