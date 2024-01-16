{r}
#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("knitr")
install.packages("janitor")
install.packages("lubridate")
install.packages("tidyverse")
library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)


{r}
#### Simulate ####
set.seed(853)

simulated_occupancy_data <-
  tibble(
    date = rep(x = as.Date("2023-01-01") + c(0:364), times = 3),
    # Based on Eddelbuettel: https://stackoverflow.com/a/21502386
    shelter = c(
      rep(x = "Shelter 1", times = 365),
      rep(x = "Shelter 2", times = 365),
      rep(x = "Shelter 3", times = 365)
    ),
    location_city = sample(
      x = c("Toronto","North York","Etobicoke","Scarborough","Vaughan"),
      size = 365*3,
      replace = TRUE),
    number_occupied =
      rpois(
        n = 365 * 3,
        lambda = 30
      ) # Draw 1,095 times from the Poisson distribution
  )

head(simulated_occupancy_data)