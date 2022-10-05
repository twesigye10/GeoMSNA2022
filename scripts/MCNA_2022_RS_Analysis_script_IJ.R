### Packages
library(dplyr)
library(readxl)
library(openxlsx)
library(purrr)
library(srvyr)
library(illuminate)
library(sf)
library(jtools)
library(randomColor)
options(scipen = 999)

## Calling dataset

data_set <- read.csv("data/irq_clean_data_with_rs_indicators.csv")

## Filtering out unwanted rows

data_set <- data_set %>% filter(strata_and_pop_group != "Returnee HH_al_rutba")

## Variable prep
data_set$how_much_debt_log <- data_set$how_much_debt %>% log()

data_set$Distance_log <- data_set$Distance %>% log10() 


# Tests
# MCNA variables to check -- Food consumption score -- fcs, Hunger scale, Unemployed HHH, Debt per person, Debt HH, main source of food


fcs_correlation_check <- weighted_pearson_test(data = data_set,dep_var = "fcs", 
                                               strata = "strata_and_pop_group",survey_weights = "survey_weight",
                                               ind_var = c("rs_NDVI_pct_median_Mar2022","rs_VCI_Mar2022","Distance_log", "rs_NDVI_z_score_Mar2022", "rs_NDVI_Mar2022" ))


debt_correlation_check <- weighted_pearson_test(data = data_set,dep_var = "how_much_debt_log", 
                                                strata = "strata_and_pop_group",survey_weights = "survey_weight",
                                                ind_var = c("rs_NDVI_pct_median_May2022","rs_VCI_May2022","Distance_log"))


unemplyed_relation_check <- illuminate::weighted_t_test(data = data_set, 
                                                        binary_variable = "head_seek_work",
                                                        non_binary_variable =   c("rs_NDVI_pct_median_May2022","rs_VCI_May2022","Distance_log"),
                                                        strata = "strata_and_pop_group",
                                                        survey_weights = "survey_weight")



all_correlation_check <- fcs_correlation_check %>% bind_rows(debt_correlation_check,unemplyed_relation_check) 


write_list <- list(
  "all_correlation_check" = all_correlation_check
  #'"data_set" = data_set
)


write_excel_as_reach_format(write_list,"corelation_checks.xlsx")

