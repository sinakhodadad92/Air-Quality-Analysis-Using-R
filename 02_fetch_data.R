fetch_openaq_data <- function(city, parameter = "pm25", limit = 1000) {
  url <- paste0("https://api.openaq.org/v2/measurements?",
                "city=", city,
                "&parameter=", parameter,
                "&limit=", limit,
                "&sort=desc")
  
  response <- GET(url)
  data <- fromJSON(rawToChar(response$content))$results
  
  df <- as.data.frame(data)
  df$city <- city
  return(df)
}

cities <- c("London", "Paris", "Berlin")
data_list <- lapply(cities, fetch_openaq_data)
air_quality_df <- bind_rows(data_list)

str(air_quality_df)
