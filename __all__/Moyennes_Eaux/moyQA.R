CARD$P.variable = "moyQA"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = NULL
CARD$P.glose = "Moyenne inter-annuelle des moyennes intra-annuelles des débits journaliers"
CARD$P.topic = c("Débit", "Moyennes Eaux", "Liés à une statistique")
CARD$P.sampling_period = "09-01"

CARD$P1.funct = list(QA=mean)
CARD$P1.funct_args = list("Q", na.rm=TRUE)
CARD$P1.time_step = "year"
CARD$P1.sampling_period = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("moyQA"=mean)
CARD$P2.funct_args = list("QA", na.rm=TRUE)
CARD$P2.time_step = "none"
