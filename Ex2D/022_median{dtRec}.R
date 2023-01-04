CARD$P.var = "median{dtRec}"
CARD$P.unit = "jour"
CARD$P.glose = "Médiane des temps de récession"
CARD$P.topic = c("Crue", "Signature hydrologique")

CARD$P1.funct = list("median{dtRec}_obs"=compute_dtRec,
                      "median{dtRec}_sim"=compute_dtRec)
CARD$P1.funct_args = list(list(Q="Q_obs"),
                           list(Q="Q_sim"))
CARD$P1.timeStep = "none"
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10
