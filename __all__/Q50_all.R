CARD$P.var = "Q50"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Débit seuil avec une probabilité de dépassement de 50% (centile 50%)"
CARD$P.topic = c("Moyennes Eaux", "Liés à une statistique")

CARD$P1.funct = list(Q50_obs=compute_Qp,
                      Q50_sim=compute_Qp)
CARD$P1.funct_args = list(list("Q_obs", p=0.5),
                           list("Q_sim", p=0.5))
CARD$P1.timeStep = "none"
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10
