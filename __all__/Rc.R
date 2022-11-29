ASHES$P.var = "Rc"
ASHES$P.unit = "m^{3}.s^{-1}.mm^{-1}"
ASHES$P.glose = "Le rapport entre la somme des débits et la somme des précipitations"
ASHES$P.event = "model"

ASHES$P1.funct = list(Rc=compute_Rc)
ASHES$P1.funct_args = list("Q", "P")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
