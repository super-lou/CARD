ASHES$P.var = "QJXA-10"
ASHES$P.unit = "m^{3}.s^{-1}"
ASHES$P.glose = "Maximums annuels des débits journaliers de période de retour 10 ans"
ASHES$P.event = "Crue"
ASHES$P.samplePeriod = '09-01'
    
ASHES$P1.funct = list(QJXA=maxNA)
ASHES$P1.funct_args = list("Q", na.rm=TRUE)
ASHES$P1.timeStep = "year"
ASHES$P1.samplePeriod = '09-01'
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10

ASHES$P2.funct = list("QJXA-10"=get_Xn)
ASHES$P2.funct_args = list("QJXA", waterType="high")
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10
ASHES$P2.rmNApct = FALSE
