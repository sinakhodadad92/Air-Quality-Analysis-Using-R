ggplot(cleaned_data, aes(x = datetime, y = value, color = city)) +
  geom_line(alpha = 0.7) +
  labs(title = "PM2.5 Levels Over Time",
       x = "Date",
       y = "PM2.5 (µg/m³)") +
  theme_minimal()

daily_avg <- cleaned_data %>%
  mutate(date = as.Date(datetime)) %>%
  group_by(city, date) %>%
  summarise(pm25 = mean(value, na.rm = TRUE), .groups = "drop")

ts_data <- daily_avg %>%
  as_tsibble(index = date, key = city)

autoplot(ts_data, pm25) +
  labs(title = "Daily PM2.5 Time Series")

berlin_ts <- filter(ts_data, city == "Berlin")

model <- berlin_ts %>%
  model(STL(pm25 ~ season(window = "periodic")))

components(model) %>%
  autoplot() +
  labs(title = "STL Decomposition – Berlin PM2.5")