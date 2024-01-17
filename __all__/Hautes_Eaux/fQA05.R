CARD$P.variable = "fQA05"
CARD$P.unit = "jour.an^{-1}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"
CARD$P.glose = "Fréquence annuelle de dépassement (Q > Q05)"
CARD$P.topic = c("Débit", "Hautes Eaux")
CARD$P.sampling_period = "Mois du minimum des débits mensuels"
    
CARD$P1.funct = list(lowLim=compute_Qp)
CARD$P1.funct_args = list("Q", p=0.05)
CARD$P1.time_step = "none"
CARD$P1.NApct_lim = NULL
CARD$P1.NAyear_lim = 10
CARD$P1.keep = "all"

CARD$P2.funct = list(fQA05=compute_fAp)
CARD$P2.funct_args = list("Q", lowLim="lowLim")
CARD$P2.time_step = "year"
CARD$P2.sampling_period = list(min, list("Q", na.rm=TRUE))
CARD$P2.NApct_lim = 3
