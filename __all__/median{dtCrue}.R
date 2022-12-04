ASHES$P.var = "median{dtCrue}"
ASHES$P.unit = "jour"
ASHES$P.glose = "Médiane de l’ensemble des nombres de jour où la différence entre le débit journalier et le débit de base est supérieur à la moitié du maximum annuel"
ASHES$P.event = "Crue"
ASHES$P.samplePeriod = '09-01'
    
ASHES$P1.funct = list(BF_obs=BFS,
                      BF_sim=BFS)
ASHES$P1.funct_args = list(list("Q_obs"),
                           list("Q_sim"))
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.keep = TRUE

ASHES$P2.funct = list(dQ_obs=minus,
                      dQ_sim=minus)
ASHES$P2.funct_args = list(list("Q_obs", "BF_obs"),
                           list("Q_sim", "BF_sim"))
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
ASHES$P2.keep = TRUE

ASHES$P3.funct = list(lowLim_obs=maxNA,
                      lowLim_sim=maxNA)
ASHES$P3.funct_args = list(list("Q_obs", div=2, na.rm=TRUE),
                           list("Q_sim", div=2, na.rm=TRUE))
ASHES$P3.timeStep = "year"
ASHES$P3.samplePeriod = '09-01'
ASHES$P3.NApct_lim = 20
ASHES$P3.keep = TRUE

ASHES$P4.funct = list(dtCrue_obs=apply_threshold,
                      dtCrue_sim=apply_threshold)
ASHES$P4.funct_args = list(list("dQ_obs",
                                lim="lowLim_obs",
                                where="above",
                                what="length",
                                select_longest=TRUE),
                           list("dQ_sim",
                                lim="lowLim_sim",
                                where="above",
                                what="length",
                                select_longest=TRUE))
ASHES$P4.timeStep = "year"
ASHES$P4.samplePeriod = '09-01'
ASHES$P4.NApct_lim = 20

ASHES$P5.funct = list("median{dtCrue}_obs"=median,
                      "median{dtCrue}_sim}"=median)
ASHES$P5.funct_args = list(list("dtCrue_obs", na.rm=TRUE),
                           list("dtCrue_sim", na.rm=TRUE))
ASHES$P5.timeStep = "none"
ASHES$P5.NApct_lim = 20