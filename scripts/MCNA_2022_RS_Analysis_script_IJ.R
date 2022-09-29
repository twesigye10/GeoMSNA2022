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

data_set <- fetch_msna(country_code = "irq")

data_set <- data_set %>% filter(strata_and_pop_group != "Returnee HH_al_rutba")

## converting distances by log

data_set <- data_set$Distance %>% log()
dataset <- data_set$rs_avg_dist_perm_water_pix_20172020 %>% log()

### Target MCNA Variables -- Food consumption score, Hunger scale score, debt value, main source of food, HH unemployed

## Pearson correlation test -- continuous + continuous


# variable details --------------------------------------------------------

# variable 1: fcs 
      # what is the distributions?

data_set$how_much_debt_log <- data_set$how_much_debt %>% log()

# variable 2; NDVI
     # what is the distribution
data_set$Distance_log <- data_set$Distance %>% log10() 


# test between variable 1 and variable 2 

# what are the prerequisites for pearson correlation check?


fcs_correlation_check <- weighted_pearson_test(data = data_set,dep_var = "fcs", 
                                              strata = "strata_and_pop_group",survey_weights = "survey_weight",
                                              ind_var = c("rs_NDVI_pct_median_May2022","rs_VCI_May2022","Distance_log"))


debt_correlation_check <- weighted_pearson_test(data = data_set,dep_var = "how_much_debt_log", 
                                               strata = "strata_and_pop_group",survey_weights = "survey_weight",
                                               ind_var = c("rs_NDVI_pct_median_May2022","rs_VCI_May2022","Distance_log"))


all_correlation_check <- fcs_correlation_check %>% bind_rows(debt_correlation_check) 


write_list <- list(
  "all_correlation_check" = all_correlation_check
  #'"data_set" = data_set
)


write_excel_as_reach_format(write_list,"corelation_checks.xlsx")
