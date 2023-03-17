CARD$P.var = "FDC"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Flow Duration Curve"
CARD$P.topic = "Moyennes Eaux"
    
CARD$P1.funct = list(FDC=compute_FDC)
CARD$P1.funct_args = list("Q", n=1000, isNormLaw=TRUE)
CARD$P1.timeStep = "none"
CARD$P1.NAyear_lim = 10
