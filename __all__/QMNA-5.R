ASHES$P.var = "QMNA-5"
ASHES$P.unit = "m^{3}.s^{-1}"
ASHES$P.glose = "Minimum annuel des débits mensuels de période de retour 5 ans"
ASHES$P.event = "Étiage"
ASHES$P.samplePeriod = c('05-01', '11-30')
    
ASHES$P1.funct = list(QM_obs=mean,
                      QM_sim=mean)
ASHES$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE))
ASHES$P1.timeStep = "year-month"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list(QMNA_obs=minNA,
                      QMNA_sim=minNA)
ASHES$P2.funct_args = list(list("QM_obs", na.rm=TRUE),
                           list("QM_sim", na.rm=TRUE))
ASHES$P2.timeStep = "year"
ASHES$P2.samplePeriod = c('05-01', '11-30')
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10

ASHES$P3.funct = list("QMNA-5_obs"=get_Xn,
                      "QMNA-5_sim"=get_Xn)
ASHES$P3.funct_args = list(list("QMNA_obs",
                                returnPeriod=5,
                                waterType="low"),
                           list("QMNA_sim",
                                returnPeriod=5,
                                waterType="low"))
ASHES$P3.timeStep = "none"
ASHES$P3.NApct_lim = 20
ASHES$P3.NAyear_lim = 10
