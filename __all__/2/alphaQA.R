CARD$P.var = c("alphaQA", "HYPalphaQA")
CARD$P.unit = "m^{3}.s^{-1}.an^{-1}"
CARD$P.glose = "Pente de Sen et résultat du test de Mann-Kendall pour les moyennes annuelles des débits journaliers"
CARD$P.topic = c("Moyennes Eaux", "Liés à une statistique")
CARD$P.samplePeriod = "09-01"
    
CARD$P1.funct = list(QA_obs=mean,
                      QA_sim=mean)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = "09-01"
CARD$P1.NApct_lim = 3
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(alphaQA_obs=get_MKalpha,
                      HYPalphaQA_obs=get_MKH,
                      alphaQA_sim=get_MKalpha,
                      HYPalphaQA_sim=get_MKH)
CARD$P2.funct_args = list(list("QA_obs", level=0.1),
                           list("QA_obs", level=0.1),
                           list("QA_sim", level=0.1),
                           list("QA_sim", level=0.1))
CARD$P2.timeStep = "none"
