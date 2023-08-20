CARD$P.var = "RAl_ratio"
CARD$P.unit = ""
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Ratio des précipitations annuelles liquides sur les précipitations annuelles totales"
CARD$P.topic = c("Précipitations", "Modérée")
CARD$P.samplePeriod = "09-01"

CARD$P1.funct = list(RA=sum,
                     RAl=sum)
CARD$P1.funct_args = list(list("P", na.rm=TRUE),
                          list("Pl", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(RAl_ratio=divided)
CARD$P2.funct_args = list("RAl", "RA")
CARD$P2.timeStep = "year"