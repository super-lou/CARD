CARD$P.var = "tDEB_etiage"
CARD$P.unit = "jour de l'année"
CARD$P.glose = "Date de la première moyenne sur 10 jours sous le maximum des minimums annuels de la moyenne sur 10 jours du débit journalier (début d'étiage)"
CARD$P.topic = "Basses Eaux"
CARD$P.samplePeriod = c("05-01", "11-30")

CARD$P1.funct = list(VC10_obs=rollmean_center,
                     VC10_sim=rollmean_center)
CARD$P1.funct_args = list(list("Q_obs", k=10),
                          list("Q_sim", k=10))
CARD$P1.timeStep = "none"
CARD$P1.keep = "all"

CARD$P2.funct = list(VCN10_obs=minNA,
                     VCN10_sim=minNA)
CARD$P2.funct_args = list(list("VC10_obs", na.rm=TRUE),
                          list("VC10_sim", na.rm=TRUE))
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = c("05-01", "11-30")
CARD$P2.NApct_lim = 3
CARD$P2.NAyear_lim = 10
CARD$P2.keep = "all"

CARD$P3.funct = list(upLim_obs=maxNA,
                     upLim_sim=maxNA)
CARD$P3.funct_args = list(list("VCN10_obs", na.rm=TRUE),
                          list("VCN10_sim", na.rm=TRUE))
CARD$P3.timeStep = "none"
CARD$P3.keep = "all"

CARD$P4.funct = list(tDEB_etiage_obs=apply_threshold,
                     tDEB_etiage_sim=apply_threshold)
CARD$P4.funct_args = list(list("VC10_obs",
                               lim="upLim_obs",
                               where="under",
                               what="first",
                               select="longest"),
                          list("VC10_sim",
                               lim="upLim_sim",
                               where="under",
                               what="first",
                               select="longest"))
CARD$P4.timeStep = "year"
CARD$P4.samplePeriod = c("05-01", "11-30")
CARD$P4.isDate = TRUE
CARD$P4.NApct_lim = 3

