ASHES$P.var = "QAmean"
ASHES$P.unit = "m^{3}.s^{-1}"
ASHES$P.glose = "Moyenne inter-annuelle des moyennes intra-annuelles des débits journaliers"
ASHES$P.event = "Moyennes Eaux"
ASHES$P.samplePeriod = '09-01'
    
ASHES$P1.funct = list(QA=mean)
ASHES$P1.funct_args = list("Q", na.rm=TRUE)
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list(QAmean=mean)
ASHES$P2.funct_args = list("QA", na.rm=TRUE)
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10
ASHES$P2.rmNApct = FALSE
