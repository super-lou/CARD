CARD$P.var = "P_r"
CARD$P.unit = ""
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Ratio des précipitation"
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

CARD$P2.funct = list(moyPA=mean,
                     moyPAl=mean,
                     moyPAs=mean)
CARD$P2.funct_args = list(list("PA", na.rm=TRUE),
                          list("PAl", na.rm=TRUE),
                          list("PAs", na.rm=TRUE))
CARD$P2.timeStep = "none"

CARD$P3.funct = list(Pl_r=divided,
                     Ps_r=divided)
CARD$P3.funct_args = list(list("moyPAl", "moyPA"),
                          list("moyPAs", "moyPA"))
CARD$P3.timeStep = "none"
