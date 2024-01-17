CARD$P.variable = "QA25"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = "#543005 #8C510A #BF812D #DFC27D #F6E8C3 #C7EAE5 #80CDC1 #35978F #01665E #003C30"
CARD$P.glose = "Débit seuil annuel avec une probabilité de dépassement de 25% (centile 75%)"
CARD$P.topic = c("Débit", "Moyennes Eaux")
CARD$P.sampling_period = "01-01"
    
CARD$P1.funct = list(QA25=compute_Qp)
CARD$P1.funct_args = list("Q", p=0.25)
CARD$P1.time_step = "year"
CARD$P1.sampling_period = "01-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
