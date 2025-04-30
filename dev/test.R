
devtools::load_all()


CARD_name=list(A=c("QA", "QMNA"),
               B=list(c("VCX3", "VCN10-5"),
                      C=list("VCN10",
                             E=c("QMNA", "QJXA"))
                      ))

CARD_name=c("QA", "QMNA")

CARD_management(CARD_name=CARD_name, overwrite=TRUE)
