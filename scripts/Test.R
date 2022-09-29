# variable check - for distribution ----
data_set <- read.csv("clean_data_with_rs_indicators.csv")

data_set <- data_set %>% filter(strata_and_pop_group != "Returnee HH_al_rutba")


data_set$fcs %>% hist()
data_set$how_much_debt %>% log() %>% hist()

# RS indicators -- shapiro test -- for normal distribution

shapiro.test (data_set$rs_NDVI_Mar2022)


