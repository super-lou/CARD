ASHES$P.var = "median{dtRec}"
ASHES$P.unit = "jour"
ASHES$P.glose = "Médiane des temps de récession"
ASHES$P.topic = c("Signature hydrologique", "Crue")

ASHES$P1.funct = list("median{dtRec}_obs"=compute_dtRec,
                      "median{dtRec}_sim"=compute_dtRec)
ASHES$P1.funct_args = list(list(Q="Q_obs"),
                           list(Q="Q_sim"))
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
