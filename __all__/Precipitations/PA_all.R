CARD$P.var = "PA"
CARD$P.unit = "mm"
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Précipitation annuelle"
CARD$P.topic = c("Climat", "Précipitation")
CARD$P.samplePeriod = "09-01"

CARD$P1.funct = list(PA=sum,
                     PAl=sum,
                     PAs=sum)
CARD$P1.funct_args = list(list("P", na.rm=TRUE),
                          list("Pl", na.rm=TRUE),
                          list("Ps", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
