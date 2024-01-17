CARD$P.variable = "VCX3"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"
CARD$P.glose = "Maximum annuel de la moyenne sur 3 jours du débit journalier"
CARD$P.topic = c("Débit", "Hautes Eaux", "Liés à une statistique")
CARD$P.sampling_period = "Mois du minimum des débits mensuels"
    
CARD$P1.funct = list(VC3=rollmean_center)
CARD$P1.funct_args = list("Q", k=3)
CARD$P1.time_step = "none"
CARD$P1.keep = "all"
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(VCX3=maxNA)
CARD$P2.funct_args = list("VC3", na.rm=TRUE)
CARD$P2.time_step = "year"
CARD$P2.sampling_period = list(min, list("Q", na.rm=TRUE))
CARD$P2.NApct_lim = 3
