


res = EXstat::CARD_extraction(data=NULL,
                              CARD_path=".",
                              CARD_dir="__all__",
                              extract_only_metadata=TRUE)

ASHE::write_tibble(res$metaEX, "metaEX_all.csv")
