CARD$P.var = "FDC"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Flow Duration Curve"
CARD$P.topic = "Moyennes Eaux"
    
CARD$P1.funct = list(FDC_obs=compute_FDC,
                     FDC_sim=compute_FDC)
CARD$P1.funct_args = list(list("Q_obs", n=366),
                          list("Q_sim", n=366))
CARD$P1.timeStep = "none"
CARD$P1.NApct_lim = NULL
CARD$P1.NAyear_lim = 10
