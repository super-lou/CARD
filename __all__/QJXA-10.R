ASHES$P.var = "QJXA-10"
ASHES$P.unit = "m^{3}.s^{-1}"
ASHES$P.glose = "Maximums annuels des débits journaliers de période de retour 10 ans"
ASHES$P.topic = c("Liés à une statistique", "Crue")
ASHES$P.samplePeriod = '09-01'
    
ASHES$P1.funct = list(QJXA_obs=maxNA,
                      QJXA_sim=maxNA)
ASHES$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE))
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list("QJXA-10_obs"=get_Xn,
                      "QJXA-10_sim"=get_Xn)
ASHES$P2.funct_args = list(list("QJXA_obs",
                                returnPeriod=10,
                                waterType="high"),
                           list("QJXA_sim",
                                returnPeriod=10,
                                waterType="high"))
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
