CARD$P.variable = "med{centreBF}"
CARD$P.unit = "jour de l'année"
CARD$P.is_date = TRUE
CARD$P.is_normalize = FALSE
CARD$P.palette = NULL
CARD$P.glose = "Médiane du centre des écoulements lents, date à laquelle 50% de l’intégrale sous la courbe du débit de base est atteinte"
CARD$P.topic = c("Débit", "Écoulements Lents")
CARD$P.sampling_period = '09-01'
    
CARD$P1.funct = list(centreBF=compute_tVolSnowmelt)
CARD$P1.funct_args = list("Q", p=0.5)
CARD$P1.time_step = "year"
CARD$P1.sampling_period = '09-01'
CARD$P1.is_date = TRUE
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("med{centreBF}"=circular_median)
CARD$P2.funct_args = list("centreBF", periodicity=365.25, na.rm=TRUE)
CARD$P2.time_step = "none"
