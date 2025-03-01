#' load_core_hh_indicators
#'
#' @param country_code 
#'
#' @return named list containing variable column names and labels

load_core_hh_indicators <-  function(country_code="irq"){
  if (country_code=="irq"){
    res <- list(
      `Food Consumption Score (numeric)`= "fcs",
      `Food Consumption Score (categorical)`= "fcs_category",
      `Household Hunger Scale (categorical)` = "household_hunger_scale",
      `main source of food (categorical)` = "food_source",
      `HHH unemployed (categorical)` = "head_seek_work",
      `HH debt (numeric)` = "how_much_debt",
      `debt per member > 90k (categorical)` = "g37",
      `HH income (numeric)`= "inc_employment_pension", ## income from employment and/or pension
      `Medical expense` = "medical_exp",
      `Health issues chronic` = "health_issue_chronic"
    
      
    )
    
  }
  if(country_code=="som"){
    res <- list(
      `Food Consumption Score (numeric)`= "fcs", # seen
      `Food Consumption Score (categorical)`= "i.fcs_cat", # seen
      # `Household Hunger Scale (categorical)` = "household_hunger_scale",
      # `main source of food (categorical)` = "food_source",
      # `HHH unemployed (categorical)` = "head_seek_work",
      `HH debt (numeric)` = "total_hh_debt", # seen
      # `debt per member > 90k (categorical)` = "g37",
      `HH income (numeric)`= "total_house_income"#, # seen
      # `Medical expense` = "medical_exp",
      # `Health issues chronic` = "health_issue_chronic"
    )  
  }
  if(country_code=="nga"){
    res <- list(
      `Flooding Incident` = "nature_safety_incident/flooding",
      `Livestock decrease (rain)` = "hoh_livestock_decrease/drought"
    )
    
  }
  return(res)
}


