
devtools::load_all()

# CARD_name = list("Température"=c("TMA_month", "TSA_season", "TA"),
#                  "Hautes Eaux"=c("QJXA", "tQJXA", "VCX3",
#                                  "tVCX3", "VCX10", "tVCX10",
#                                  "Q01A", "Q05A", "Q10A",
#                                  "fQ01A", "fQ05A", "fQ10A",
#                                  "dtFlood"),
#                  "Moyennes Eaux"=c("QA", "Q75A", "Q50A",
#                                    "Q25A", "QSA_season", "QMA_month"),
#                  "Basses Eaux"=c("VCN10", "tVCN10", "QNA",
#                                  "QMNA", "VCN3", "VCN30",
#                                  "Q90A", "Q95A", "Q99A",
#                                  "startLF", "centerLF", "endLF",
#                                  "dtLF", "vLF"),
#                  "Débit de Base"=c("startBF", "centerBF", "endBF",
#                                    "dtBF", "vBF"),
#                  "Précipitations"=c("RCXA1", "RCXA5", "dtRA20mm",
#                                     "dtRSA20mm_season",
#                                     "dtRMA20mm_month",
#                                     "dtRA50mm", "dtRSA50mm_season",
#                                     "dtRMA50mm_month", "RA",
#                                     "RSA_season", "RMA_month", "RAl",
#                                     "RSAl_season", "RMAl_month",
#                                     "RAl_ratio", "RAs", "RSAs_season",
#                                     "RMAs_month", "RAs_ratio",
#                                     "dtRA01mm", "dtRSA01mm_season",
#                                     "dtRMA01mm_month", "dtCWDA",
#                                     "dtCWDSA_season", "dtCWDMA_month",
#                                     "dtCDDA", "dtCDDSA_season",
#                                     "dtCDDMA_month"))


# CARD_name=list(A=c("QA", "QMNA"),
               # B=list(c("VCX3", "VCN10-5"),
                      # C=list("VCN10",
                             # E=c("QMNA", "QJXA"))
                      # ))

# CARD_name=c("QA", "QMNA")

# CARD_management(CARD_name=CARD_name, overwrite=TRUE)






# library(airGRdatasets)
# library(dplyr)

# data = tibble(airGRdatasets::A273011002$TS) %>%
#     mutate(code="A273011002",
#            Date=as.Date(Date)) %>%
#     rename(Q=Qls)

# res = CARD_extraction(data, CARD_name=c("dtRec", "med{dtRec}"))
# res


Process = sourceProcess("../inst/__all__/Flow/Low_Flows/serie/startLF.R")
