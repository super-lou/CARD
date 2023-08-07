CARD$P.var = paste0("dtP01_", gsub("[.]", "", gsub("û", "u", gsub("é", "e", format(seq.Date(as.Date("1970-01-01"), as.Date("1970-12-01"), "month"), "%b")))))
CARD$P.unit = "jour"
CARD$P.is_date = FALSE
CARD$P.normalize = FALSE
CARD$P.reverse_palette = FALSE
CARD$P.glose = paste0("Nombre de jours pluvieux de chaque ",
                      format(seq.Date(as.Date("1970-01-01"), as.Date("1970-12-01"), "month"), "%B"),
                      " (nombre de jours où les précipitations dépassent 1 mm)")
CARD$P.topic = c("Précipitations", "Climat")
    
CARD$P1.funct = list(dtP01=apply_threshold)
CARD$P1.funct_args = list("P", lim=1,
                          where="above",
                          what="length",
                          select="all")
CARD$P1.timeStep = "year-month"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10
CARD$P1.compress = TRUE
