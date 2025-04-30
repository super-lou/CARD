
devtools::load_all()


# CARD_name=list(A=c("QA", "QMNA"),
#                B=list(c("VCX3", "VCN10-5"),
#                       C=list("VCN10",
#                              E=c("QMNA", "QJXA"))
#                       ))

# CARD_name=c("QA", "QMNA")

# CARD_management(CARD_name=CARD_name, overwrite=TRUE)




library(airGRdatasets)
library(dplyr)

data = tibble(airGRdatasets::A273011002$TS) %>%
    mutate(code="A273011002",
           Date=as.Date(Date)) %>%
    rename(Q=Qls)

res = CARD_extraction(data, CARD_name=c("dtRec", "med{dtRec}"))
res
