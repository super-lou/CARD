CARD$P.var = "PCX30"
CARD$P.unit = "mm"
CARD$P.is_date = FALSE
CARD$P.normalize = TRUE
CARD$P.reverse_palette = FALSE
CARD$P.glose = "Maximum annuel de la moyenne sur 30 jours des précipitations journalières"
CARD$P.topic = c("Précipitations", "Climat")
CARD$P.samplePeriod = "Mois du minimum des précipitations mensuelles"
     
CARD$P1.funct = list(PC30=rollmean_center)
CARD$P1.funct_args = list("P", k=30)
CARD$P1.timeStep = "none"
CARD$P1.keep = "all"
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(PCX30=maxNA)
CARD$P2.funct_args = list("PC30", na.rm=TRUE)
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = list(min, list("P", na.rm=TRUE))
CARD$P2.NApct_lim = 3
