CARD$P.var = "BFI"
CARD$P.unit = ""
CARD$P.glose = "Baseflow index"
CARD$P.topic = c("Baseflow", "Signature hydrologique")

CARD$P1.funct = list(BF_obs=BFS,
                      BF_sim=BFS)
CARD$P1.funct_args = list(list("Q_obs"),
                           list("Q_sim"))
CARD$P1.timeStep = "none"
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10
CARD$P1.keep = TRUE

CARD$P2.funct = list(BFI_obs=get_BFI,
                      BFI_sim=get_BFI)
CARD$P2.funct_args = list(list("Q_obs", "BF_obs"),
                           list("Q_sim", "BF_sim"))
CARD$P2.timeStep = "none"
CARD$P2.NApct_lim = 20
