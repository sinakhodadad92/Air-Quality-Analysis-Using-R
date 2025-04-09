cleaned_data <- air_quality_df %>%
  select(city, date.utc, value, unit) %>%
  mutate(datetime = ymd_hms(date.utc)) %>%
  filter(!is.na(value)) %>%
  arrange(datetime)

sum(is.na(cleaned_data))

# Preprocessing
cleaned_all <- all_data %>%
  select(city, parameter, date.utc, value) %>%
  mutate(datetime = ymd_hms(date.utc),
         month = month(datetime, label = TRUE)) %>%
  filter(!is.na(value))

# Plot
ggplot(monthly_avg, aes(x = month, y = mean_value, fill = parameter)) +
  geom_col(position = "dodge") +
  facet_wrap(~ city) +
  labs(title = "Seasonal Patterns of PM2.5 and NO2 by City",
       x = "Month", y = "Average Level (µg/m³)") +
  theme_minimal()