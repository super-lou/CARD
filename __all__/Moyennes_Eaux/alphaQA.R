CARD$P.variable = c("alphaQA", "HYPalphaQA")
CARD$P.unit = "m^{3}.s^{-1}.an^{-1}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = c(TRUE,
                     FALSE)
CARD$P.palette = NULL
CARD$P.glose = "Pente de Sen et résultat du test de Mann-Kendall pour les moyennes annuelles des débits journaliers"
CARD$P.topic = c("Débit", "Moyennes Eaux", "Liés à une statistique")
CARD$P.sampling_period = "09-01"
    
CARD$P1.funct = list(QA=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.time_step = "year"
CARD$P1.sampling_period = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(alphaQA=get_MKalpha,
                     HYPalphaQA=get_MKH)
CARD$P2.funct_args = list(list("QA", level=0.1),
                          list("QA", level=0.1))
CARD$P2.time_step = "none"
