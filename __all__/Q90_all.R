CARD$P.var = "Q90"
CARD$P.unit = "m^{3}.s^{-1}"
CARD$P.glose = "Débit seuil avec une probabilité de dépassement de 90% (centile 10%)"
CARD$P.topic = c("Basses Eaux", "Liés à une statistique")

CARD$P1.funct = list(Q90_obs=compute_Qp,
                      Q90_sim=compute_Qp)
CARD$P1.funct_args = list(list("Q_obs", p=0.9),
                           list("Q_sim", p=0.9))
CARD$P1.timeStep = "none"
CARD$P1.NApct_lim = 20
CARD$P1.NAyear_lim = 10
