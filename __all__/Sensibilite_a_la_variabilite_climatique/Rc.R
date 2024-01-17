CARD$P.variable = "Rc"
CARD$P.unit = "m^{3}.s^{-1}.mm^{-1}"
CARD$P.is_date = FALSE
CARD$P.is_normalize = TRUE
CARD$P.palette = NULL
CARD$P.glose = "Coefficient de ruissellement, rapport entre la somme des débits et la somme des précipitations"
CARD$P.topic = c("Précipitations/Débit", "Sensibilité à la variabilité climatique", "Signature hydrologique")

CARD$P1.funct = list(Rc=compute_Rc)
CARD$P1.funct_args = list("Q", "P")
CARD$P1.time_step = "none"
CARD$P1.NAyear_lim = 10
