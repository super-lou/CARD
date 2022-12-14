ASHES$P.var = "Rc"
ASHES$P.unit = "m^{3}.s^{-1}.mm^{-1}"
ASHES$P.glose = "Le rapport entre la somme des débits et la somme des précipitations"
ASHES$P.topic = "Signature hydrologique"

ASHES$P1.funct = list(Rc_obs=compute_Rc,
                      Rc_sim=compute_Rc)
ASHES$P1.funct_args = list(list("Q_obs", "Pl"),
                           list("Q_sim", "Pl"))
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
