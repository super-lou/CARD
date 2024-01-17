CARD$P.variable = "RCXA5"
CARD$P.unit = "mm"
CARD$P.is_date = FALSE
CARD$P.is_normalize = FALSE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"
CARD$P.glose = "Maximum annuel du cumul sur 5 jours des précipitations journalières"
CARD$P.topic =  c("Précipitations", "Forte")
CARD$P.sampling_period = "Mois du minimum des précipitations mensuelles"
    
CARD$P1.funct = list(RC5=rollsum_center)
CARD$P1.funct_args = list("R", k=5)
CARD$P1.time_step = "none"
CARD$P1.keep = "all"
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(RCXA5=maxNA)
CARD$P2.funct_args = list("RC5", na.rm=TRUE)
CARD$P2.time_step = "year"
CARD$P2.sampling_period = list(min, list("R", na.rm=TRUE))
CARD$P2.NApct_lim = 3
