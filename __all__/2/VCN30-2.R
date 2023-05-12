CARD$P.var = "VCN30-2"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Minimum annuel de la moyenne sur 30 jours du débit journalier de période de retour 2 ans"
CARD$P.topic = c("Basses Eaux", "Liés à une statistique")
CARD$P.samplePeriod = c("05-01", "11-30")
    
CARD$P1.funct = list(VC30_obs=rollmean_center,
                      VC30_sim=rollmean_center)
CARD$P1.funct_args = list(list("Q_obs", k=30),
                           list("Q_sim", k=30))
CARD$P1.timeStep = "none"
CARD$P1.keep = "all"
CARD$P1.NAyear_lim = 10

CARD$P2.funct = list(VCN30_obs=minNA,
                      VCN30_sim=minNA)
CARD$P2.funct_args = list(list("VC30_obs", na.rm=TRUE),
                           list("VC30_sim", na.rm=TRUE))
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = c("05-01", "11-30")
CARD$P2.NApct_lim = 3

CARD$P3.funct = list("VCN30-2_obs"=get_Xn,
                      "VCN30-2_sim"=get_Xn)
CARD$P3.funct_args = list(list("VCN30_obs",
                                returnPeriod=2,
                                waterType="low"),
                           list("VCN30_sim",
                                returnPeriod=2,
                                waterType="low"))
CARD$P3.timeStep = "none"
