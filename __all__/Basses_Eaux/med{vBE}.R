CARD$P.variable = "med{vBE}"
CARD$P.unit = "hm^{3}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = NULL
CARD$P.glose = "Médiane du volume de déficite des basses eaux, intégrale de la courbe de la moyenne sur 10 jours sous le maximum des VCN10"
CARD$P.topic = c("Débit", "Basses Eaux")
CARD$P.sampling_period = "Mois du maximum des débits mensuels"

CARD$P1.funct = list(VC10=rollmean_center)
CARD$P1.funct_args = list("Q", k=10)
CARD$P1.time_step = "none"
CARD$P1.keep = "all"

CARD$P2.funct = list(VCN10=minNA)
CARD$P2.funct_args = list("VC10", na.rm=TRUE)
CARD$P2.time_step = "year"
CARD$P2.sampling_period = list(max, list("Q", na.rm=TRUE))
CARD$P2.NApct_lim = 3
CARD$P2.NAyear_lim = 10
CARD$P2.keep = "all"

CARD$P3.funct = list(upLim=maxNA)
CARD$P3.funct_args = list("VCN10", na.rm=TRUE)
CARD$P3.time_step = "none"
CARD$P3.keep = "all"

CARD$P4.funct = list(vBE=compute_VolDef)
CARD$P4.funct_args = list("VC10",
                          select="longest",
                          upLim="upLim")
CARD$P4.time_step = "year"
CARD$P4.sampling_period = list(max, list("Q", na.rm=TRUE))
CARD$P4.NApct_lim = 3

CARD$P5.funct = list("med{vBE}"=median)
CARD$P5.funct_args = list("vBE", na.rm=TRUE)
CARD$P5.time_step = "none"
