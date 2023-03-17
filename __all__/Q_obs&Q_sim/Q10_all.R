CARD$P.var = "Q10"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Débit seuil avec une probabilité de dépassement de 10% (centile 90%)"
CARD$P.topic = c("Hautes Eaux", "Liés à une statistique")

CARD$P1.funct = list(Q10_obs=compute_Qp,
                      Q10_sim=compute_Qp)
CARD$P1.funct_args = list(list("Q_obs", p=0.1),
                           list("Q_sim", p=0.1))
CARD$P1.timeStep = "none"
CARD$P1.NAyear_lim = 10
