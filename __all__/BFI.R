ASHES$P.var = "BFI"
ASHES$P.unit = ""
ASHES$P.glose = "Base flow index"
ASHES$P.event = "model"

ASHES$P1.funct = list(BF=BFS)
ASHES$P1.funct_args = list("Q")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.keep = TRUE

ASHES$P2.funct = list(BFI=get_BFI)
ASHES$P2.funct_args = list("Q", "BF")
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10
