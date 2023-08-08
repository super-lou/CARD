CARD$P.var = c("dtP01_DJF", "dtP01_MAM", "dtP01_JJA", "dtP01_SON")
CARD$P.unit = "jour"
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = c("Nombre de jours pluvieux en hiver (nombre de jours où les précipitations dépassent 1 mm)",
                 "Nombre de jours pluvieux au printemps (nombre de jours où les précipitations dépassent 1 mm)",
                 "Nombre de jours pluvieux en été (nombre de jours où les précipitations dépassent 1 mm)",
                 "Nombre de jours pluvieux en automne (nombre de jours où les précipitations dépassent 1 mm)")
CARD$P.topic = c("Précipitations", "Faible")

CARD$P1.funct = list(dtP01=apply_threshold)
CARD$P1.funct_args = list("P", lim=1,
                          where="above",
                          what="length",
                          select="all")
CARD$P1.timeStep = "year-season"
CARD$P1.Seasons = c("DJF", "MAM", "JJA", "SON")
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE
