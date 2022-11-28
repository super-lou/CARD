ASHES$P.var = "BFM"
ASHES$P.unit = ""
ASHES$P.glose = "Base flow magnitude"
ASHES$P.event = "model"

ASHES$P1.funct = list(BF=BFS)
ASHES$P1.funct_args = list("Q")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.keep = TRUE

ASHES$P2.funct = list(BFmean=mean)
ASHES$P2.funct_args = list("BF", na.rm=TRUE)
ASHES$P2.timeStep = "yearday"
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10
ASHES$P2.keep = TRUE

ASHES$P3.funct = list(BFI=get_BFM)
ASHES$P3.funct_args = list("BFmean")
ASHES$P3.timeStep = "none"
ASHES$P3.NApct_lim = 20
ASHES$P3.NAyear_lim = 10
ASHES$P3.rmNApct = FALSE
