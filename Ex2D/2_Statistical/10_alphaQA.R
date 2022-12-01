ASHES$P.var = "alphaQA"
ASHES$P.unit = "m^{3}.s^{-1}.an^{-1}"
ASHES$P.glose = "Pente de Sen et résultat du test de Mann-Kendall pour les moyennes annuelles des débits journaliers"
ASHES$P.event = "Moyennes Eaux"
ASHES$P.samplePeriod = '09-01'
    
ASHES$P1.funct = list(QA_obs=mean,
                      QA_sim=mean)
ASHES$P1.funct_args = list(list("Q_obs", na.rm=TRUE),
                           list("Q_sim", na.rm=TRUE))
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list(alphaQA_obs=get_MKalpha,
                      HalphaQA_obs=get_MKH,
                      alphaQA_sim=get_MKalpha,
                      HalphaQA_sim=get_MKH)
ASHES$P2.funct_args = list(list("QA_obs", level=0.1),
                           list("QA_obs", level=0.1),
                           list("QA_sim", level=0.1),
                           list("QA_sim", level=0.1))
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10
