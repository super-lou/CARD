ASHES$P.var = "tCrue"
ASHES$P.unit = "jour"
ASHES$P.glose = "Médiane de l’ensemble des nombre de jour où la différence entre le débit journalier et le débit de base est supérieur à la moitié du maximum annuel"
ASHES$P.event = "Crue"

ASHES$P1.funct = list(Rc=compute_Rc)
ASHES$P1.funct_args = list("Q", "P")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.rmNApct = FALSE
