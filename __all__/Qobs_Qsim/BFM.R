CARD$P.var = "BFM"
CARD$P.unit = ""
CARD$P.glose = "Baseflow magnitude"
CARD$P.topic = c("Écoulements Lents", "Signature hydrologique")

CARD$P1.funct = list(BF_obs=BFS,
                      BF_sim=BFS)
CARD$P1.funct_args = list(list("Q_obs"),
                           list("Q_sim"))
CARD$P1.timeStep = "none"
CARD$P1.keep = "all"

CARD$P2.funct = list(BFA_obs=mean,
                      BFA_sim=mean)
CARD$P2.funct_args = list(list("BF_obs", na.rm=TRUE),
                           list("BF_sim", na.rm=TRUE))
CARD$P2.timeStep = "yearday"


CARD$P3.funct = list(BFM_obs=get_BFM,
                      BFM_sim=get_BFM)
CARD$P3.funct_args = list(list("BFA_obs"),
                           list("BFA_sim"))
CARD$P3.timeStep = "none"
