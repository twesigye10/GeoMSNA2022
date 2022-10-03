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
      `HHH unemployed (categorical)` = "unemployed_seek_work",
      `HH debt (numeric)` = "how_much_debt",
      `debt per member > 90k (categorical)` = "g37"
      
    )
    
  }
  if(country_code=="som"){
    list(
      
    )
  }
  return(res)
}


