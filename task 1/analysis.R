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

health_zones <- cleaned_all %>%
  mutate(health_zone = case_when(
    parameter == "pm25" & value > 25 ~ "High Impact",
    parameter == "no2" & value > 40 ~ "High Impact",
    TRUE ~ "Moderate or Low"
  ))

impact_summary <- health_zones %>%
  group_by(city, parameter, health_zone) %>%
  summarise(count = n(), .groups = "drop") %>%
  group_by(city, parameter) %>%
  mutate(proportion = count / sum(count))

ggplot(impact_summary, aes(x = city, y = proportion, fill = health_zone)) +
  geom_bar(stat = "identity", position = "stack") +
  facet_wrap(~ parameter) +
  labs(title = "Simulated Health Impact Zones Based on WHO Guidelines",
       y = "Proportion of Measurements", x = "City") +
  theme_minimal()