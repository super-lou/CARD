

devtools::load_all()

res = CARD_extraction(data=NULL,
                      CARD_name=NULL,
                      extract_only_metadata=TRUE)

ASHE::write_tibble(res$metaEX, file.path("inst", "extdata",
                                         "metaEX_all.csv"))
