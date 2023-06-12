CARD$P.var = c("PA",
               "PAl",
               "PAs")
CARD$P.unit = "mm.jour^{-1}"
CARD$P.glose = c("Précipitation totale annuelle (pluie + neige)",
                 "Précipitation liquide annuelle (pluie)",
                 "Précipitation solide annuelle (neige)")
CARD$P.topic = "Précipitation"
CARD$P.samplePeriod = "09-01"

CARD$P1.funct = list(PA=mean,
                     PAl=mean,
                     PAs=mean)
CARD$P1.funct_args = list(list("P", na.rm=TRUE),
                          list("Pl", na.rm=TRUE),
                          list("Ps", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
