CARD$P.var = "tDEB_BF"
CARD$P.unit = "jour de l'année"
CARD$P.glose = "Début des écoulements lents (date lorsque 10% de l’intégrale sous la courbe du débit de base est atteinte)"
CARD$P.topic = "Crue Nivale"
CARD$P.samplePeriod = '09-01'
    
CARD$P1.funct = list(X=compute_tVolSnowmelt)
CARD$P1.funct_args = list("Q", p=0.1)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = '09-01'
CARD$P1.isDate = TRUE
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.rmNApct = FALSE
