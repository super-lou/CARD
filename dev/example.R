
devtools::load_all()


metaEX_all = CARD_list_all()
metaEX_all


install.packages("airGRdatasets")
library(airGRdatasets)
library(dplyr)

data = tibble(airGRdatasets::A273011002$TS) %>%
    mutate(code="A273011002",
           Date=as.Date(Date)) %>%
    rename(Q=Qls)

res = CARD_extraction(data, CARD_name="QA")
res

# For one station
data1 = tibble(airGRdatasets::A273011002$TS) %>%
    mutate(code="A273011002",
           Date=as.Date(Date)) %>%
    rename(Q_obs=Qls)

# and an other
data2 = tibble(airGRdatasets::H622101001$TS) %>%
    mutate(code="H622101001",
           Date=as.Date(Date)) %>%
    rename(Q_obs=Qls)
# make one tibble
data = bind_rows(data1, data2)

# add some noise for mock simulation data
data$Q_sim = data$Q_obs + rnorm(nrow(data), mean=0, sd=100)

# and perfom an extraction
res = CARD_extraction(data,
                      CARD_name=c("QA", "QMNA", "VCN10-5"),
                      suffix=c("obs", "sim"))
res
