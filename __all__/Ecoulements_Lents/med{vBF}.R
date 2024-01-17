CARD$P.variable = "med{vBF}"
CARD$P.unit = "hm^{3}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = NULL
CARD$P.glose = "Médiane du volume des écoulements lents, intégrale sous la courbe du débit de base"
CARD$P.topic = c("Débit", "Écoulements Lents")
CARD$P.sampling_period = '09-01'

CARD$P1.funct = list(vBF=compute_VolSnowmelt)
CARD$P1.funct_args = list("Q")
CARD$P1.time_step = "year"
CARD$P1.sampling_period = '09-01'
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("med{vBF}"=median)
CARD$P2.funct_args = list("vBF", na.rm=TRUE)
CARD$P2.time_step = "none"
