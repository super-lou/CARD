ASHES$P.var = "KGE"
ASHES$P.unit = ""
ASHES$P.glose = "Coeffcient d'efficacité de Kling-Gupta de la racine carrée des données"
ASHES$P.event = "model"

ASHES$P1.funct = compute_KGEsqrt
ASHES$P1.funct_args = c("Qobs", "Qsim")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.rmNApct = FALSE
