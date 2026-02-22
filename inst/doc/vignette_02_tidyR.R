## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.height = 5,
  fig.width = 7
)

## ----packages, message = FALSE, warning = FALSE-------------------------------
library(echos)
library(tidyverse)
library(tsibble)
library(fable)

## ----data, fig.alt = "Plot actual values"-------------------------------------
train_frame <- m4_data %>%
  filter(series %in% c("M21655", "M2717"))

train_frame

p <- ggplot()

p <- p + geom_line(
  data = train_frame,
  aes(
    x = index,
    y = value),
  linewidth = 0.5
)

p <- p + facet_wrap(
  vars(series),
  ncol = 1,
  scales = "free")

p

## ----mable_frame--------------------------------------------------------------
mable_frame <- train_frame %>%
  model(
    "ESN" = ESN(value),
    "ARIMA" = ARIMA(value)
    )

mable_frame

## ----fable_frame, fig.alt = "Plot forecast and train data"--------------------
fable_frame <- mable_frame %>%
  forecast(h = 18)

fable_frame

fable_frame %>%
  autoplot(train_frame, level = NULL)

