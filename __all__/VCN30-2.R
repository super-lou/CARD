ASHES$P.var = "VCN30-2"
ASHES$P.unit = "m^{3}.s^{-1}"
ASHES$P.glose = "Minimum annuel de la moyenne sur 30 jours du débit journalier de période de retour 2 ans"
ASHES$P.event = "Étiage"
ASHES$P.samplePeriod = c('05-01', '11-30')
    
ASHES$P1.funct = list(VC30_obs=rollmean_center,
                      VC30_sim=rollmean_center)
ASHES$P1.funct_args = list(list("Q_obs", k=30),
                           list("Q_sim", k=30))
ASHES$P1.timeStep = "none"
ASHES$P1.keep = TRUE

ASHES$P2.funct = list(VCN30_obs=minNA,
                      VCN30_sim=minNA)
ASHES$P2.funct_args = list(list("VC30_obs", na.rm=TRUE),
                           list("VC30_sim", na.rm=TRUE))
ASHES$P2.timeStep = "year"
ASHES$P2.samplePeriod = c('05-01', '11-30')
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10

ASHES$P3.funct = list("VCN30-2_obs"=get_Xn,
                      "VCN30-2_sim"=get_Xn)
ASHES$P3.funct_args = list(list("VCN30_obs",
                                returnPeriod=2,
                                waterType="low"),
                           list("VCN30_sim",
                                returnPeriod=2,
                                waterType="low"))
ASHES$P3.timeStep = "none"
ASHES$P3.NApct_lim = 20
ASHES$P3.NAyear_lim = 10
