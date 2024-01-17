CARD$P.variable = "med{finBF}"
CARD$P.unit = "jour de l'année"
CARD$P.is_date = TRUE
CARD$P.is_normalize = FALSE
CARD$P.palette = NULL
CARD$P.glose = "Médiane de la fin des écoulements lents, date à laquelle 90% de l’intégrale sous la courbe du débit de base est atteinte"
CARD$P.topic = c("Débit", "Écoulements Lents")
CARD$P.sampling_period = '09-01'
    
CARD$P1.funct = list(finBF=compute_tVolSnowmelt)
CARD$P1.funct_args = list("Q", p=0.9)
CARD$P1.time_step = "year"
CARD$P1.sampling_period = '09-01'
CARD$P1.is_date = TRUE
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("med{finBF}"=circular_median)
CARD$P2.funct_args = list("finBF", periodicity=365.25, na.rm=TRUE)
CARD$P2.time_step = "none"
