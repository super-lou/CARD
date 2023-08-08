CARD$P.var = c("dtPsec_DJF", "dtPsec_MAM", "dtPsec_JJA", "dtPsec_SON")
CARD$P.unit = "jour"
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = c("Nombre de jours sans pluie en hiver",
                 "Nombre de jours sans pluie au printemps",
                 "Nombre de jours sans pluie en été",
                 "Nombre de jours sans pluie en automne")
CARD$P.topic = c("Précipitations", "Période sèche")

CARD$P1.funct = list(dtPsec=apply_threshold)
CARD$P1.funct_args = list("P", lim=0,
                          where="under",
                          what="length",
                          select="all")
CARD$P1.timeStep = "year-season"
CARD$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE
