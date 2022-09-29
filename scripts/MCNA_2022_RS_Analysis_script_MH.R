## Calling libraries

library(dplyr)
library(readxl)
library(openxlsx)
library(purrr)
library(srvyr)
library(illuminate)
library(sf)
library(jtools)
# source("04_script/statistical_test_function.R")
options(scipen = 999)


## Reading CSV

clean_data_with_rs_indicator <- fetch_msna("irq")

clean_data_with_rs_indicator <- clean_data_with_rs_indicator %>% filter(strata_and_pop_group != "Returnee HH_al_rutba")


clean_data_with_rs_indicator$Distance <- clean_data_with_rs_indicator$Distance %>% log()
clean_data_with_rs_indicator$rs_avg_dist_perm_water_pix_20172020 <- clean_data_with_rs_indicator$rs_avg_dist_perm_water_pix_20172020 %>% log()
clean_data_with_rs_indicator$rs_city_accessibility2015 <- clean_data_with_rs_indicator$rs_city_accessibility2015 %>% log()

correlation_test <- list()
independent_variable <- c("Distance", "rs_avg_dist_perm_water_pix_20172020","rs_NDVI_May2022")


for(i in independent_variable){
  
  
  correlation_test[[i]] <- weighted_pearson_test(data = clean_data_with_rs_indicator,
                                                 ind_var =i,
                                                 dep_var = c("fcs","how_much_debt","food_exp","medical_exp","rs_city_accessibility2015"),
                                                 strata = "strata_and_pop_group",
                                                 survey_weights = "survey_weight")
  
  
}

correlation_test_final <- do.call("bind_rows",correlation_test)



t_test_result <- list()

independent_variable <- c("Distance","rs_avg_dist_perm_water_pix_20172020","rs_NDVI_May2022","rs_healthcare_accessibility2019")

for(x in independent_variable){
  
  t_test_result[[x]] <- weighted_t_test(data = clean_data_with_rs_indicator,
                                        dependent_variables = c("need_priorities.drinking_water","need_priorities.food","need_priorities.healthcare"),
                                        independent_variable = x,
                                        strata = "strata_and_pop_group",
                                        survey_weights = "survey_weight")
  
  
}



t_test <- do.call("bind_rows",t_test_result)

write_list <- list(
  correlation_test_final ="correlation_test_final",
  t_test ="t_test"
)

write_excel_as_reach_format(write_list,"correlation_test_mcna.xlsx")


m2 <- lm(fcs~Distance+log(rs_healthcare_accessibility2019),clean_data_with_rs_indicator)


avPlots(m2)


vif(m2)
summary(m2)










