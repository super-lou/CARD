CARD$P.variable = "QMNA_hivernal"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"
CARD$P.glose = "Minimum hivernal des débits mensuels"
CARD$P.topic = c("Débit", "Basses Eaux")
CARD$P.sampling_period = c("11-01", "04-30")

CARD$P1.funct = list(QMA_hivernal=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.time_step = "year-month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.keep = "all"

CARD$P2.funct = list(QMNA_hivernal=minNA)
CARD$P2.funct_args = list("QMA_hivernal", na.rm=TRUE)
CARD$P2.time_step = "year"
CARD$P2.sampling_period = c("11-01", "04-30")
CARD$P2.NApct_lim = 3
