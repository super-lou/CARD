CARD$P.variable = "vBF"
CARD$P.unit = "hm^{3}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = "#003C30 #01665E #35978F #80CDC1 #C7EAE5 #F6E8C3 #DFC27D #BF812D #8C510A #543005"
CARD$P.glose = "Volume des écoulements lents, intégrale sous la courbe du débit de base"
CARD$P.topic = c("Débit", "Écoulements Lents")
CARD$P.sampling_period = '09-01'

CARD$P1.funct = list(vBF=compute_VolSnowmelt)
CARD$P1.funct_args = list("Q")
CARD$P1.time_step = "year"
CARD$P1.sampling_period = '09-01'
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
