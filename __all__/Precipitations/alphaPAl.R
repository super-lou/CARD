CARD$P.var = "alphaPAl"
CARD$P.unit = "mm.an^{-1}"
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Pente de Sen du cumul des précipitations annuelles liquides"
CARD$P.topic = c("Précipitation", "Modérée")
CARD$P.samplePeriod = "Mois du maximum des débits mensuels"

CARD$P1.funct = list(PAl=sum)
CARD$P1.funct_args = list("Pl", na.rm=TRUE)
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
# CARD$P1.samplePeriod = list(max, list("Q", na.rm=TRUE))
# CARD$P1.samplePeriod = c("12-01", "02-28")
# CARD$P1.samplePeriod = c("03-01", "05-31")
# CARD$P1.samplePeriod = c("06-01", "08-31")
# CARD$P1.samplePeriod = c("09-01", "11-30")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(alphaPAl=get_MKalpha,
                     HYPalphaPAl=get_MKH,
                     PalphaPAl=get_MKp)
CARD$P2.funct_args = list(list("PAl", level=0.1),
                          list("PAl", level=0.1),
                          list("PAl", level=0.1))
CARD$P2.timeStep = "none"
