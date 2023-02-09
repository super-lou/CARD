CARD$P.var = "VCN10-5"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Minimum annuel de la moyenne sur 10 jours du débit journalier de période de retour 5 ans"
CARD$P.topic = c("Basses Eaux", "Liés à une statistique")
CARD$P.samplePeriod = c('05-01', '11-30')
    
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
CARD$P2.samplePeriod = c('05-01', '11-30')

CARD$P3.funct = list("VCN10-5_obs"=get_Xn,
                      "VCN10-5_sim"=get_Xn)
CARD$P3.funct_args = list(list("VCN10_obs",
                                returnPeriod=5,
                                waterType="low"),
                           list("VCN10_sim",
                                returnPeriod=5,
                                waterType="low"))
CARD$P3.timeStep = "none"
