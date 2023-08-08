CARD$P.var = c("dtP20_DJF", "dtP20_MAM", "dtP20_JJA", "dtP20_SON")
CARD$P.unit = "jour"
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = c("Nombre de jours de forte pluie en hiver (nombre de jours où les précipitations dépassent 20 mm)",
                 "Nombre de jours de forte pluie au printemps (nombre de jours où les précipitations dépassent 20 mm)",
                 "Nombre de jours de forte pluie en été (nombre de jours où les précipitations dépassent 20 mm)",
                 "Nombre de jours de forte pluie en automne (nombre de jours où les précipitations dépassent 20 mm)")
CARD$P.topic = c("Précipitations", "Forte")

CARD$P1.funct = list(dtP20=apply_threshold)
CARD$P1.funct_args = list("P", lim=20,
                          where="above",
                          what="length",
                          select="all")
CARD$P1.timeStep = "year-season"
CARD$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE
