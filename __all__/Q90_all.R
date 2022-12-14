ASHES$P.var = "Q90"
ASHES$P.unit = "m^{3}.s^{-1}"
ASHES$P.glose = "Débit seuil avec une probabilité de dépassement de 90% (centile 10%)"
ASHES$P.topic = c("Étiage", "Liés à une statistique")

ASHES$P1.funct = list(Q90_obs=compute_Qp,
                      Q90_sim=compute_Qp)
ASHES$P1.funct_args = list(list("Q_obs", p=0.9),
                           list("Q_sim", p=0.9))
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
