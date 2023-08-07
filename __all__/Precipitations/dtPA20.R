CARD$P.var = "dtPA20"
CARD$P.unit = "jour"
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Nombre de jours de forte pluie dans l'année (nombre de jours où les précipitations dépassent 20 mm)"
CARD$P.topic = c("Précipitations", "Climat")
CARD$P.samplePeriod = "09-01"

CARD$P1.funct = list(dtPA20=apply_threshold)
CARD$P1.funct_args = list("P", lim=20,
                          where="above",
                          what="length",
                          select="all")
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
