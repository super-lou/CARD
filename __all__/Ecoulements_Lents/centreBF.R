CARD$P.variable = "centreBF"
CARD$P.unit = "jour de l'année"
CARD$P.is_date = TRUE
CARD$P.is_normalize = FALSE
CARD$P.palette = "#893687 #BC66A5 #E596C3 #EAC5DD #EFE2E9 #F5E4E2 #F2D7B5 #E9BD6F #DC8C48 #CD5629"
CARD$P.glose = "Centre des écoulements lents, date à laquelle 50% de l’intégrale sous la courbe du débit de base est atteinte"
CARD$P.topic = c("Débit", "Écoulements Lents")
CARD$P.sampling_period = '09-01'
    
CARD$P1.funct = list(centreBF=compute_tVolSnowmelt)
CARD$P1.funct_args = list("Q", p=0.5)
CARD$P1.time_step = "year"
CARD$P1.sampling_period = '09-01'
CARD$P1.is_date = TRUE
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
