CARD$P.var = "Rc"
CARD$P.unit = "m^{3}.s^{-1}.mm^{-1}"
CARD$P.glose = "Le rapport entre la somme des débits et la somme des précipitations"
CARD$P.topic = c("Sensibilité à la variabilité climatique", "Signature hydrologique")

CARD$P1.funct = list(Rc_obs=compute_Rc,
                      Rc_sim=compute_Rc)
CARD$P1.funct_args = list(list("Q_obs", "Pl"),
                           list("Q_sim", "Pl"))
CARD$P1.timeStep = "none"
CARD$P1.NAyear_lim = 10
