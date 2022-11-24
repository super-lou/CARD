ASHES$P.var = "KGE"
ASHES$P.unit = ""
ASHES$P.glose = "Coeffcient d'efficacité de Kling-Gupta"
ASHES$P.event = "model"

ASHES$P1.funct = compute_KGE
ASHES$P1.funct_args = c("Qobs", "Qsim")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.rmNApct = FALSE
