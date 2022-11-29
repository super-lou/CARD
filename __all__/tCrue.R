ASHES$P.var = "tCrue"
ASHES$P.unit = "jour"
ASHES$P.glose = "Médiane de l’ensemble des nombres de jour où la différence entre le débit journalier et le débit de base est supérieur à la moitié du maximum annuel"
ASHES$P.event = "Crue"
ASHES$P.samplePeriod = '09-01'
    
ASHES$P1.funct = list(BF=BFS)
ASHES$P1.funct_args = list("Q")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.keep = TRUE

ASHES$P2.funct = list(dQ=minus)
ASHES$P2.funct_args = list("Q", "BF")
ASHES$P2.timeStep = "none"
ASHES$P2.NApct_lim = 20
ASHES$P2.NAyear_lim = 10
ASHES$P2.keep = TRUE

ASHES$P3.funct = list(lowLim=maxNA)
ASHES$P3.funct_args = list("Q", div=2, na.rm=TRUE)
ASHES$P3.timeStep = "year"
ASHES$P3.samplePeriod = '09-01'
ASHES$P3.NApct_lim = 20
ASHES$P3.NAyear_lim = 10
ASHES$P3.keep = TRUE

ASHES$P4.funct = list(dt=apply_threshold)
ASHES$P4.funct_args = list("dQ",
                           lim="lowLim",
                           where="above",
                           what="length",
                           select_longest=TRUE)
ASHES$P4.timeStep = "year"
ASHES$P4.samplePeriod = '09-01'
ASHES$P4.NApct_lim = 20
ASHES$P4.NAyear_lim = 10

ASHES$P5.funct = list(tCrue=median)
ASHES$P5.funct_args = list("dt", na.rm=TRUE)
ASHES$P5.timeStep = "none"
ASHES$P5.NApct_lim = 20
ASHES$P5.NAyear_lim = 10
