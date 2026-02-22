## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.height = 5,
  fig.width = 7
)

## ----packages, message = FALSE, warning = FALSE-------------------------------
library(echos)

## ----data---------------------------------------------------------------------
# Convert 'AirPassengers' dataset from ts to numeric vector
xdata <- as.numeric(AirPassengers)
# Forecast horizon
n_ahead <- 12
# Number of observations (total)
n_obs <- length(xdata)
# Number of observations (training data)
n_train <- n_obs - n_ahead

# Prepare train and test data
xtrain <- xdata[(1:n_train)]
xtest <- xdata[((n_train+1):n_obs)]

xtrain
xtest

## ----model, fig.alt = "Plot actual and fitted values"-------------------------
# Train ESN model
xmodel <- train_esn(y = xtrain)

# Summarize model
summary(xmodel)

## ----forecast, fig.alt = "Plot forecast and test data"------------------------
# Forecast ESN model
xfcst <- forecast_esn(xmodel, n_ahead = n_ahead)

# Extract point and interval forecasts
xfcst$point
xfcst$interval

# Plot forecast and test data
plot(xfcst, test = xtest)

## ----tuning, fig.alt = "Time series cross-validation"-------------------------
# Tune hyperparameters via time series cross-validation
xfit <- tune_esn(
  y = xdata,
  n_ahead = 12,
  n_split = 5,
  alpha = seq(0.1, 1.0, 0.1),
  rho   = c(1.0),
  tau   = c(0.4)
)

# Summarize and visualize optimal hyperparameter configuration
summary(xfit)
plot(xfit)

