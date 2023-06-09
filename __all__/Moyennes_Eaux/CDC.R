CARD$P.var = "CDC"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Courbe des débits classés"
CARD$P.topic = "Moyennes Eaux"
    
CARD$P1.funct = list(CDC=compute_FDC)
CARD$P1.funct_args = list("Q", n=1000, isNormLaw=TRUE)
CARD$P1.timeStep = "none"
CARD$P1.NAyear_lim = 10
