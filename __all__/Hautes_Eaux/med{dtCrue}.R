CARD$P.variable = "med{dtCrue}"
CARD$P.unit = "jour"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = NULL
CARD$P.glose = "Médiane de l’ensemble des nombres de jour où la différence entre le débit journalier et le débit de base est supérieur à la moitié du maximum annuel"
CARD$P.topic = c("Débit", "Hautes Eaux", "Signature hydrologique")
CARD$P.sampling_period = "Mois du minimum des débits mensuels"
    
CARD$P1.funct = list(dQ=dBFS)
CARD$P1.funct_args = list("Q")
CARD$P1.time_step = "none"
CARD$P1.keep = "all"
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(dQXA=maxNA)
CARD$P2.funct_args = list("dQ", na.rm=TRUE)
CARD$P2.time_step = "year"
CARD$P2.sampling_period = list(min, list("Q", na.rm=TRUE))
CARD$P2.keep = "all"

CARD$P3.funct = list(lowLim=divided)
CARD$P3.funct_args = list("dQXA", 2, first=TRUE)
CARD$P3.time_step = "year"
CARD$P3.sampling_period = list(min, list("Q", na.rm=TRUE))
CARD$P3.keep = "all"

CARD$P4.funct = list(dtCrue=apply_threshold)
CARD$P4.funct_args = list("dQ",
                          lim="lowLim",
                          where=">=",
                          what="length",
                          select="dQXA")
CARD$P4.time_step = "year"
CARD$P4.sampling_period = list(min, list("Q", na.rm=TRUE))
CARD$P4.NApct_lim = 3

CARD$P5.funct = list("med{dtCrue}"=median)
CARD$P5.funct_args = list("dtCrue", na.rm=TRUE)
CARD$P5.time_step = "none"
