CARD$P.var = "alphaVCN10"
CARD$P.unit = "m^{3}.s^{-1}.an^{-1}"
CARD$P.glose = "Pente de Sen et résultat du test de Mann-Kendall pour les minimums annuel de la moyenne sur 10 jours du débit journalier"
CARD$P.topic = c("Étiage", "Liés à une statistique")
CARD$P.samplePeriod = c('05-01', '11-30')
    
CARD$P1.funct = list(VC10_obs=rollmean_center,
                      VC10_sim=rollmean_center)
CARD$P1.funct_args = list(list("Q_obs", k=10),
                           list("Q_sim", k=10))
CARD$P1.timeStep = "none"
CARD$P1.keep = TRUE

CARD$P2.funct = list(VCN10_obs=minNA,
                      VCN10_sim=minNA)
CARD$P2.funct_args = list(list("VC10_obs", na.rm=TRUE),
                           list("VC10_sim", na.rm=TRUE))
CARD$P2.timeStep = "year"
CARD$P2.samplePeriod = c('05-01', '11-30')
CARD$P2.NApct_lim = 20
CARD$P2.NAyear_lim = 10

CARD$P3.funct = list(alphaVCN10_obs=get_MKalpha,
                      HYPalphaVCN10_obs=get_MKH,
                      alphaVCN10_sim=get_MKalpha,
                      HYPalphaVCN10_sim=get_MKH)
CARD$P3.funct_args = list(list("VCN10_obs", level=0.1),
                           list("VCN10_obs", level=0.1),
                           list("VCN10_sim", level=0.1),
                           list("VCN10_sim", level=0.1))
CARD$P3.timeStep = "none"
CARD$P3.NApct_lim = 20
