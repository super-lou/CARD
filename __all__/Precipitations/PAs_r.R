CARD$P.var = "PAs_r"
CARD$P.unit = ""
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Ratio des précipitations annuelles solides sur les précipitations annuelles totales"
CARD$P.topic = c("Précipitations", "Climat")
CARD$P.samplePeriod = "09-01"

CARD$P1.funct = list(PA=sum,
                     PAs=sum)
CARD$P1.funct_args = list(list("P", na.rm=TRUE),
                          list("Ps", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(PAs_r=divided)
CARD$P2.funct_args = list("PAs", "PA")
CARD$P2.timeStep = "year"
