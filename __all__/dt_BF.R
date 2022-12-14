CARD$P.var = "dt_BF"
CARD$P.unit = "jour"
CARD$P.glose = "Durée des écoulements lents (durée entre 10% et 90% de l’intégrale sous la courbe du débit de base)"
CARD$P.topic = "Crue Nivale"
CARD$P.samplePeriod = '09-01'

CARD$P1.funct = list(X=compute_tSnowmelt)
CARD$P1.funct_args = list("Q", p1=0.1, p2=0.9)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = '09-01'
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.rmNApct = FALSE
