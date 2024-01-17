CARD$P.variable = "BFI"
CARD$P.unit = "sans unité"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = NULL
CARD$P.glose = "Baseflow index"
CARD$P.topic = c("Débit", "Écoulements Lents", "Signature hydrologique")

CARD$P1.funct = list(BF=BFS)
CARD$P1.funct_args = list("Q")
CARD$P1.time_step = "none"
CARD$P1.keep = "all"
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(BFI=get_BFI)
CARD$P2.funct_args = list("Q", "BF")
CARD$P2.time_step = "none"
