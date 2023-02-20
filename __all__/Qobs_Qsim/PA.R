CARD$P.var = "PA"
CARD$P.unit = "mm.jour^{-1}"
CARD$P.glose = "Précipitation annuelle"
CARD$P.topic = "Précipitation"
    
CARD$P1.funct = list(PAs=mean,
                     PAl=mean,
                     PA=mean)
CARD$P1.funct_args = list(list("Ps", na.rm=TRUE),
                          list("Pl", na.rm=TRUE),
                          list("P", na.rm=TRUE))
CARD$P1.timeStep = "year"
