CARD$P.var = "PMXA"
CARD$P.unit = "mm"
CARD$P.is_date = FALSE
CARD$P.normalize = TRUE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Maximum annuel des précipitations mensuelles"
CARD$P.topic = c("Précipitations", "Climat")
CARD$P.samplePeriod = "Mois du minimum des précipitations mensuelles"

CARD$P1.funct = list(PMA=mean)
CARD$P1.funct_args = list("P", na.rm=TRUE)
CARD$P1.timeStep = "year-month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(PMXA=maxNA)
CARD$P2.funct_args = list("PMA", na.rm=TRUE)
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = list(min, list("PMA", na.rm=TRUE))
CARD$P2.NApct_lim = 3
