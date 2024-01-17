CARD$P.variable = "RCXA1"
CARD$P.unit = "mm"
CARD$P.is_date = FALSE
CARD$P.is_normalize = FALSE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"
CARD$P.glose = "Maximum annuel des précipitations journalières"
CARD$P.topic = c("Précipitations", "Forte")
CARD$P.sampling_period = "Mois du minimum des précipitations mensuelles"
    
CARD$P1.funct = list(RCXA1=maxNA)
CARD$P1.funct_args = list("R", na.rm=TRUE)
CARD$P1.time_step = "year"
CARD$P1.sampling_period = list(min, list("R", na.rm=TRUE))
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
