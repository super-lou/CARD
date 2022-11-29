ASHES$P.var = "alphaVCN10"
ASHES$P.unit = "m^{3}.s^{-1}.an^{-1}"
ASHES$P.glose = "Pente de Sen et résultat du test de Mann-Kendall pour les minimums annuel de la moyenne sur 10 jours du débit journalier"
ASHES$P.event = "Étiage"
ASHES$P.samplePeriod = c('05-01', '11-30')
    
ASHES$P1.funct = list(VC10=rollmean_center)
ASHES$P1.funct_args = list("Q", k=10)
ASHES$P1.timeStep = "none"
ASHES$P1.keep = TRUE

ASHES$P2.funct = list(VCN10=minNA)
ASHES$P2.funct_args = list("VC10", na.rm=TRUE)
ASHES$P2.timeStep = "year"
ASHES$P2.samplePeriod = c('05-01', '11-30')
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10

ASHES$P3.funct = list(alphaVCN10=get_MKalpha,
                      HVCN10=get_MKH)
ASHES$P3.funct_args = list(list("VCN10", level=0.1),
                           list("VCN10", level=0.1))
ASHES$P3.timeStep = "none"
ASHES$P3.NApct_lim = 20
ASHES$P3.NAyear_lim = 10
