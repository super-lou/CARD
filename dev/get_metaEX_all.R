

devtools::load_all()

res = CARD_extraction(data=NULL,
                      CARD_name=NULL,
                      extract_only_metadata=TRUE)

res$metaEX$CARD_name = res$metaEX$variable_en
res$metaEX = dplyr::relocate(res$metaEX, CARD_name, .before=variable_en)

ASHE::write_tibble(res$metaEX, file.path("inst", "extdata",
                                         "metaEX_all.csv"))
