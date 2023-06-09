CARD$P.var = "med{dtRec}"
CARD$P.unit = "jour"
CARD$P.glose = "Médiane des temps de récession"
CARD$P.topic = c("Écoulements Lents", "Signature hydrologique")

CARD$P1.funct = list("med{dtRec}"=compute_dtRec)
CARD$P1.funct_args = list(Q="Q")
CARD$P1.timeStep = "none"
CARD$P1.NAyear_lim = 10
