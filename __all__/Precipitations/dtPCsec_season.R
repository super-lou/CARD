CARD$P.var = c("dtPCsec_DJF", "dtPCsec_MAM", "dtPCsec_JJA", "dtPCsec_SON")
CARD$P.unit = "jour"
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = c("Nombre maximal de jours consécutifs sans pluie en hiver",
                 "Nombre maximal de jours consécutifs sans pluie au printemps",
                 "Nombre maximal de jours consécutifs sans pluie en été",
                 "Nombre maximal de jours consécutifs sans pluie en automne")
CARD$P.topic = c("Précipitations", "Climat")

CARD$P1.funct = list(dtPCsec=apply_threshold)
CARD$P1.funct_args = list("P", lim=0,
                          where="under",
                          what="length",
                          select="longest")
CARD$P1.timeStep = "year-season"
CARD$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE
