CARD$P.variable = c("alphaQJXA", "HYPalphaQJXA")
CARD$P.unit = "m^{3}.s^{-1}.an^{-1}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = c(TRUE,
                     FALSE)
CARD$P.palette = NULL
CARD$P.glose = "Pente de Sen et résultat du test de Mann-Kendall pour les maximums annuels des débits journaliers"
CARD$P.topic = c("Débit", "Hautes Eaux", "Liés à une statistique")
CARD$P.sampling_period = "Mois du minimum des débits mensuels"
    
CARD$P1.funct = list(QJXA=maxNA)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.time_step = "year"
CARD$P1.sampling_period = list(min, list("Q", na.rm=TRUE))
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(alphaQJXA=get_MKalpha,
                     HYPalphaQJXA=get_MKH)
CARD$P2.funct_args = list(list("QJXA", level=0.1),
                          list("QJXA", level=0.1))
CARD$P2.time_step = "none"
