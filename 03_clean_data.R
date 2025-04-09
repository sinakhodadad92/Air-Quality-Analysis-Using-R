cleaned_data <- air_quality_df %>%
  select(city, date.utc, value, unit) %>%
  mutate(datetime = ymd_hms(date.utc)) %>%
  filter(!is.na(value)) %>%
  arrange(datetime)

sum(is.na(cleaned_data))
