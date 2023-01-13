CARD$P.var = "median{dtCrue}"
CARD$P.unit = "jour"
CARD$P.glose = "Médiane de l’ensemble des nombres de jour où la différence entre le débit journalier et le débit de base est supérieur à la moitié du maximum annuel"
CARD$P.topic = c("Hautes Eaux", "Signature hydrologique")
CARD$P.samplePeriod = '09-01'
    
CARD$P1.funct = list(dQ_obs=dBFS,
                      dQ_sim=dBFS)
CARD$P1.funct_args = list(list("Q_obs"),
                           list("Q_sim"))
CARD$P1.timeStep = "none"
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10
CARD$P1.keep = "all"

CARD$P2.funct = list(dQXA_obs=maxNA,
                      dQXA_sim=maxNA)
CARD$P2.funct_args = list(list("dQ_obs", na.rm=TRUE),
                           list("dQ_sim", na.rm=TRUE))
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = '09-01'
CARD$P2.NApct_lim = 20
CARD$P2.keep = "all"

CARD$P3.funct = list(lowLim_obs=divided,
                      lowLim_sim=divided)
CARD$P3.funct_args = list(list("dQXA_obs", 2, first=TRUE),
                           list("dQXA_sim", 2, first=TRUE))
CARD$P3.timeStep = "year"
CARD$P3.samplePeriod = '09-01'
CARD$P3.NApct_lim = 20
CARD$P3.keep = "all"

CARD$P4.funct = list(dtCrue_obs=apply_threshold,
                      dtCrue_sim=apply_threshold)
CARD$P4.funct_args = list(list("dQ_obs",
                                lim="lowLim_obs",
                                where="above",
                                what="length",
                                select="dQXA_obs"),
                           list("dQ_sim",
                                lim="lowLim_sim",
                                where="above",
                                what="length",
                                select="dQXA_sim"))
CARD$P4.timeStep = "year"
CARD$P4.samplePeriod = '09-01'
CARD$P4.NApct_lim = 20

CARD$P5.funct = list("median{dtCrue}_obs"=median,
                      "median{dtCrue}_sim"=median)
CARD$P5.funct_args = list(list("dtCrue_obs", na.rm=TRUE),
                           list("dtCrue_sim", na.rm=TRUE))
CARD$P5.timeStep = "none"
CARD$P5.NApct_lim = 20
