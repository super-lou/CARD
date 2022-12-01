ASHES$P.var = "BFM"
ASHES$P.unit = ""
ASHES$P.glose = "Base flow magnitude"
ASHES$P.event = "model"

ASHES$P1.funct = list(BF_obs=BFS,
                      BF_sim=BFS)
ASHES$P1.funct_args = list(list("Q_obs"),
                           list("Q_sim"))
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.keep = TRUE

ASHES$P2.funct = list(BFA_obs=mean,
                      BFA_sim=mean)
ASHES$P2.funct_args = list(list("BF_obs", na.rm=TRUE),
                           list("BF_sim", na.rm=TRUE))
ASHES$P2.timeStep = "yearday"
ASHES$P2.NApct_lim = 20

ASHES$P3.funct = list(BFM_obs=get_BFM,
                      BFM_sim=get_BFM)
ASHES$P3.funct_args = list(list("BFA_obs"),
                           list("BFA_sim"))
ASHES$P3.timeStep = "none"
ASHES$P3.NApct_lim = 20
