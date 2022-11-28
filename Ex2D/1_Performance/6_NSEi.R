ASHES$P.var = "NSEi"
ASHES$P.unit = ""
ASHES$P.glose = "Coeffcient d'efficacité de Nash-Sutcliffe de l'inverse des données"
ASHES$P.event = "model"

ASHES$P1.funct = list(NSEi=compute_NSEi)
ASHES$P1.funct_args = list("Qobs", "Qsim")
ASHES$P1.timeStep = "none"
ASHES$P1.NApct_lim = 20
ASHES$P1.NAyear_lim = 10
ASHES$P1.rmNApct = FALSE
