CARD$P.var = "QM"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Débit moyen mensuel"
CARD$P.topic = "Moyennes Eaux"
    
CARD$P1.funct = list(QM_obs=mean,
                     QM_sim=mean)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                          list("Q_sim", na.rm=TRUE))
CARD$P1.timeStep = "month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
