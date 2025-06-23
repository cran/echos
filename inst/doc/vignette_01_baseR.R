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
# Forecast horizon
n_ahead <- 12
# Number of observations (total)
n_obs <- length(AirPassengers)
# Number of observations (training data)
n_train <- n_obs - n_ahead

# Prepare train and test data as numeric vectors
xtrain <- AirPassengers[(1:n_train)]
xtest <- AirPassengers[((n_train+1):n_obs)]

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

