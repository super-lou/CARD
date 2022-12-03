ASHES$P.var = "alphaQJXA"
ASHES$P.unit = "m^{3}.s^{-1}.an^{-1}"
ASHES$P.glose = "Pente de Sen et résultat du test de Mann-Kendall pour les maximums annuels des débits journaliers"
ASHES$P.event = "Crue"
ASHES$P.samplePeriod = '09-01'
    
ASHES$P1.funct = list(QJXA_obs=maxNA,
                      QJXA_sim=maxNA)
ASHES$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE))
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list(alphaQJXA_obs=get_MKalpha,
                      HYPalphaQJXA_obs=get_MKH,
                      alphaQJXA_sim=get_MKalpha,
                      HYPalphaQJXA_sim=get_MKH)
ASHES$P2.funct_args = list(list("QJXA_obs", level=0.1),
                           list("QJXA_obs", level=0.1),
                           list("QJXA_sim", level=0.1),
                           list("QJXA_sim", level=0.1))
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
