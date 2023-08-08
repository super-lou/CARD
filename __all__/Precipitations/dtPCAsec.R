CARD$P.var = "dtPCAsec"
CARD$P.unit = "jour"
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Nombre maximal de jours consécutifs sans pluie dans l'année"
CARD$P.topic = c("Précipitations", "Période sèche")
CARD$P.samplePeriod = "09-01"

CARD$P1.funct = list(dtPCAsec=apply_threshold)
CARD$P1.funct_args = list("P", lim=0,
                          where="under",
                          what="length",
                          select="longest")
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
