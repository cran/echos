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

## ----m4-data------------------------------------------------------------------
m4_data

## ----m4-plot, fig.width = 7, fig.height = 7, echo = FALSE, fig.alt = "M4 Dataset"----
p <- ggplot()

p <- p + geom_line(
  data = m4_data,
  aes(
    x = index,
    y = value
  )
)

p <- p + facet_wrap(
  ~series,
  ncol = 2,
  scales = "free")

p <- p + labs(x = "Time")
p <- p + labs(y = "Value")
p

## ----synthetic-data-----------------------------------------------------------
synthetic_data

## ----synthetic-plot, fig.width = 7, fig.height = 9, echo = FALSE, fig.alt = "Synthetic Dataset"----
p <- ggplot()

p <- p + geom_line(
  data = synthetic_data,
  aes(
    x = index,
    y = value
  )
)

p <- p + facet_wrap(
  ~factor(
    variable, 
    levels = c(
      "Square Wave",
      "Sawtooth Wave",
      "Harmonic Wave",
      "Harmonic Wave w/ Trend",
      "Amplitude Modulated Wave",
      "Frequency Modulated Wave",
      "AR(1) Process",
      "MA(2) Process",
      "White Noise Process",
      "Random Walk Process"
    )),
  ncol = 2,
  scales = "free")

p <- p + labs(x = "Time")
p <- p + labs(y = "Value")
p

