CARD$P.var = "mean{QA}"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Moyenne inter-annuelle des moyennes intra-annuelles des débits journaliers"
CARD$P.topic = c("Moyennes Eaux", "Liés à une statistique")
CARD$P.samplePeriod = '09-01'
    
CARD$P1.funct = list(QA_obs=mean,
                      QA_sim=mean)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = '09-01'
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list("mean{QA}_obs"=mean,
                      "mean{QA}_sim"=mean)
CARD$P2.funct_args = list(list("QA_obs", na.rm=TRUE),
                           list("QA_sim", na.rm=TRUE))
CARD$P2.timeStep = "none"
CARD$P2.NApct_lim = 20
