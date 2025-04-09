forecast_berlin <- model %>%
  forecast(h = "30 days")

autoplot(forecast_berlin, berlin_ts) +
  labs(title = "30-Day PM2.5 Forecast for Berlin")
