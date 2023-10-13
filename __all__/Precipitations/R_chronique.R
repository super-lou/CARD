CARD$P.var = "R_chronique"
CARD$P.unit = "mm"
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"
CARD$P.glose = "Cumul des précipitations totales"
CARD$P.topic = c("Précipitations", "Modérée")

CARD$P1.funct = list(R_chronique=sum)
CARD$P1.funct_args = list("P", na.rm=TRUE)
CARD$P1.timeStep = "none"
