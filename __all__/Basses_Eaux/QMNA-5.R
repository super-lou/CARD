CARD$P.variable = "QMNA-5"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = NULL
CARD$P.glose = "Minimum annuel des débits mensuels de période de retour 5 ans"
CARD$P.topic = c("Débit", "Basses Eaux", "Liés à une statistique")
CARD$P.sampling_period = "Mois du maximum des débits mensuels"
    
CARD$P1.funct = list(QMA=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.time_step = "year-month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.keep = "all"

CARD$P2.funct = list(QMNA=minNA)
CARD$P2.funct_args = list("QMA", na.rm=TRUE)
CARD$P2.time_step = "year"
CARD$P2.sampling_period = list(max, list("QMA", na.rm=TRUE))
CARD$P2.NApct_lim = 3

CARD$P3.funct = list("QMNA-5"=get_Xn)
CARD$P3.funct_args = list("QMNA",
                          returnPeriod=5,
                          waterType="low")
CARD$P3.time_step = "none"
