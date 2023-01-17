CARD$P.var = "QMNA-5"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Minimum annuel des débits mensuels de période de retour 5 ans"
CARD$P.topic = c("Basses Eaux", "Liés à une statistique")
CARD$P.samplePeriod = c('05-01', '11-30')
    
CARD$P1.funct = list(QM_obs=mean,
                      QM_sim=mean)
CARD$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE))
CARD$P1.timeStep = "year-month"
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(QMNA_obs=minNA,
                      QMNA_sim=minNA)
CARD$P2.funct_args = list(list("QM_obs", na.rm=TRUE),
                           list("QM_sim", na.rm=TRUE))
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = c('05-01', '11-30')
CARD$P2.NApct_lim = 20

CARD$P3.funct = list("QMNA-5_obs"=get_Xn,
                      "QMNA-5_sim"=get_Xn)
CARD$P3.funct_args = list(list("QMNA_obs",
                                returnPeriod=5,
                                waterType="low"),
                           list("QMNA_sim",
                                returnPeriod=5,
                                waterType="low"))
CARD$P3.timeStep = "none"
CARD$P3.NApct_lim = 20
