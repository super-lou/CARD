CARD$P.var = "QJXA-10"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Maximums annuels des débits journaliers de période de retour 10 ans"
CARD$P.topic = c("Hautes Eaux", "Liés à une statistique")
CARD$P.samplePeriod = "Mois du minimum des débits mensuels"
    
CARD$P1.funct = list(QJXA_obs=maxNA,
                      QJXA_sim=maxNA)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE))
CARD$P1.timeStep = "year"
CARD$P1.samplePeriod = list(min, list("Q_obs", na.rm=TRUE))

CARD$P2.funct = list("QJXA-10_obs"=get_Xn,
                      "QJXA-10_sim"=get_Xn)
CARD$P2.funct_args = list(list("QJXA_obs",
                                returnPeriod=10,
                                waterType="high"),
                           list("QJXA_sim",
                                returnPeriod=10,
                                waterType="high"))
CARD$P2.timeStep = "none"
