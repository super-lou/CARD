ASHES$P.var = "Q10"
ASHES$P.unit = "m^{3}.s^{-1}"
ASHES$P.glose = "Débit seuil avec une probabilité de dépassement de 10% (centile 90%)"
ASHES$P.topic = c("Liés à une statistique", "Crue")

ASHES$P1.funct = list(Q10_obs=compute_Qp,
                      Q10_sim=compute_Qp)
ASHES$P1.funct_args = list(list("Q_obs", p=0.1),
                           list("Q_sim", p=0.1))
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
