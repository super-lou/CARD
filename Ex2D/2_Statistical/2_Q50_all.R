ASHES$P.var = "Q50"
ASHES$P.unit = "m^{3}.s^{-1}"
ASHES$P.glose = "Débit seuil avec une probabilité de dépassement de 50% (centile 50%)"
ASHES$P.event = "Moyennes Eaux"

ASHES$P1.funct = list(X=compute_Qp)
ASHES$P1.funct_args = list("Q", p=0.5)
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
