ASHES$P.var = "BFI"
ASHES$P.unit = ""
ASHES$P.glose = "Baseflow index"
ASHES$P.topic = c("Baseflow", "Signature hydrologique")

ASHES$P1.funct = list(BF_obs=BFS,
                      BF_sim=BFS)
ASHES$P1.funct_args = list(list("Q_obs"),
                           list("Q_sim"))
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.keep = TRUE

ASHES$P2.funct = list(BFI_obs=get_BFI,
                      BFI_sim=get_BFI)
ASHES$P2.funct_args = list(list("Q_obs", "BF_obs"),
                           list("Q_sim", "BF_sim"))
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
