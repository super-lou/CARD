CARD$P.var = "alphaQJXA"
CARD$P.unit = "m^{3}.s^{-1}.an^{-1}"
CARD$P.glose = "Pente de Sen et résultat du test de Mann-Kendall pour les maximums annuels des débits journaliers"
CARD$P.topic = c("Crue", "Liés à une statistique")
CARD$P.samplePeriod = '09-01'
    
CARD$P1.funct = list(QJXA_obs=maxNA,
                      QJXA_sim=maxNA)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = '09-01'
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(alphaQJXA_obs=get_MKalpha,
                      HYPalphaQJXA_obs=get_MKH,
                      alphaQJXA_sim=get_MKalpha,
                      HYPalphaQJXA_sim=get_MKH)
CARD$P2.funct_args = list(list("QJXA_obs", level=0.1),
                           list("QJXA_obs", level=0.1),
                           list("QJXA_sim", level=0.1),
                           list("QJXA_sim", level=0.1))
CARD$P2.timeStep = "none"
CARD$P2.NApct_lim = 20
