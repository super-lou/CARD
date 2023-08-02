CARD$P.var = "PMNA"
CARD$P.unit = "mm"
CARD$P.is_date = FALSE
CARD$P.normalize = TRUE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Minimum annuel des précipitations mensuelles"
CARD$P.topic = c("Précipitations", "Climat")
CARD$P.samplePeriod = "Mois du maximum des débits mensuels"

CARD$P1.funct = list(PMA=mean)
CARD$P1.funct_args = list("P", na.rm=TRUE)
CARD$P1.timeStep = "year-month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.keep = "all"

CARD$P2.funct = list(PMNA=minNA)
CARD$P2.funct_args = list("PMA", na.rm=TRUE)
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = list(max, list("Q", na.rm=TRUE))
CARD$P2.NApct_lim = 3
