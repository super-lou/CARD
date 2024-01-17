CARD$P.variable = "debutBE"
CARD$P.unit = "jour de l'année"
CARD$P.is_date = TRUE
CARD$P.is_normalize = FALSE
CARD$P.palette = "#893687 #BC66A5 #E596C3 #EAC5DD #EFE2E9 #F5E4E2 #F2D7B5 #E9BD6F #DC8C48 #CD5629"
CARD$P.glose = "Début des basses eaux, date de la première moyenne sur 10 jours sous le maximum des minimums annuels de la moyenne sur 10 jours du débit journalier"
CARD$P.topic = c("Débit", "Basses Eaux")
CARD$P.sampling_period = "Mois du maximum des débits mensuels"

CARD$P1.funct = list(VC10=rollmean_center)
CARD$P1.funct_args = list("Q", k=10)
CARD$P1.time_step = "none"
CARD$P1.keep = "all"

CARD$P2.funct = list(VCN10=minNA)
CARD$P2.funct_args = list("VC10", na.rm=TRUE)
CARD$P2.time_step = "year"
CARD$P2.sampling_period = list(max, list("Q", na.rm=TRUE))
CARD$P2.NApct_lim = 3
CARD$P2.NAyear_lim = 10
CARD$P2.keep = "all"

CARD$P3.funct = list(upLim=maxNA)
CARD$P3.funct_args = list("VCN10", na.rm=TRUE)
CARD$P3.time_step = "none"
CARD$P3.keep = "all"

CARD$P4.funct = list(debutBE=apply_threshold)
CARD$P4.funct_args = list("VC10",
                          lim="upLim",
                          where="<=",
                          what="first",
                          select="longest")
CARD$P4.time_step = "year"
CARD$P4.sampling_period = list(max, list("Q", na.rm=TRUE))
CARD$P4.is_date = TRUE
CARD$P4.NApct_lim = 3

