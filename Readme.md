# 🌍 Air Quality Analysis Using R

This project explores air pollution trends across major European cities using the OpenAQ dataset. The focus is on analyzing PM2.5 and NO₂ levels, identifying seasonal patterns, and simulating potential health impact zones based on WHO air quality guidelines.

## 📊 Project Goals
- Analyze time-series data for PM2.5 and NO₂ in European cities.
- Detect seasonal patterns and pollution peaks.
- Simulate health impact zones using pollutant thresholds.
- Visualize trends using `ggplot2` and R's time series tools.

## 🛠️ Tools & Packages Used
- **R**: Core programming environment
- **ggplot2**: Data visualization
- **dplyr**, **lubridate**: Data manipulation and date handling
- **tsibble**, **fable**: Time series decomposition and forecasting
- **OpenAQ API**: Data source for pollutant levels

## 🗃️ Data Source
- [OpenAQ Platform](https://openaq.org): Public air quality data API
- Pollutants: `PM2.5`, `NO₂`
- Cities Analyzed: London, Paris, Berlin (extendable)

## 🔍 Key Insights
- Seasonal spikes in PM2.5 and NO₂ observed in winter months.
- Forecasting reveals cities with increasing pollution trends.
- Simulated health impact zones show where pollution frequently exceeds WHO safety thresholds.


## 📌 Future Work
- Extend to more cities and pollutants (O₃, CO, etc.)
- Add geospatial maps for interactive health risk zones
- Correlate with weather or lockdown data

## 📄 License
This project is for educational and research purposes.