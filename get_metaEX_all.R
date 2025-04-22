


devtools::load_all()

res = CARD_extraction(data=NULL,
                      CARD_path="inst",
                      CARD_dir="__all__",
                      extract_only_metadata=TRUE)


ASHE::write_tibble(res$metaEX, file.path("inst", "extdata",
                                         "metaEX_all.csv"))
