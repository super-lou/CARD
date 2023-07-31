CARD$P.var = "PAl_r"
CARD$P.unit = ""
CARD$P.is_date = FALSE
CARD$P.normalize = TRUE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Ratio des précipitations annuelles liquides sur les précipitations annuelles totales"
CARD$P.topic = c("Précipitations", "Climat")
CARD$P.samplePeriod = "09-01"

CARD$P1.funct = list(PA=sum,
                     PAl=sum)
CARD$P1.funct_args = list(list("P", na.rm=TRUE),
                          list("Pl", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(PAl_r=divided)
CARD$P2.funct_args = list("PAl", "PA")
CARD$P2.timeStep = "year"
