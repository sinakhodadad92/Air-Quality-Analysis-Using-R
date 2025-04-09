# Summary
daily_avg %>%
  group_by(city) %>%
  summarise(mean_pm25 = mean(pm25),
            max_pm25 = max(pm25),
            min_pm25 = min(pm25))

# Export cleaned data
write.csv(cleaned_data, "cleaned_air_quality_data.csv", row.names = FALSE)
