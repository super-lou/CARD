CARD$P.variable = "med{dtRec}"
CARD$P.unit = "jour"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = NULL
CARD$P.glose = "Médiane des temps de récession"
CARD$P.topic = c("Débit", "Écoulements Lents", "Signature hydrologique")

CARD$P1.funct = list("dtRec"=compute_dtRec)
CARD$P1.funct_args = list(Q="Q")
CARD$P1.time_step = "none"
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("med{dtRec}"=median)
CARD$P2.funct_args = list("dtRec", na.rm=TRUE)
CARD$P2.time_step = "none"
