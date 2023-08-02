CARD$P.var = "PAs"
CARD$P.unit = "mm"
CARD$P.is_date = FALSE
CARD$P.normalize = TRUE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Cumul des précipitations solides annuelles"
CARD$P.topic = c("Précipitations", "Climat")
CARD$P.samplePeriod = "09-01"

CARD$P1.funct = list(PAs=sum)
CARD$P1.funct_args = list("Ps", na.rm=TRUE)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
