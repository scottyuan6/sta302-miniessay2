{r}
write_csv(
  x = toronto_shelters_clean,
  file = "cleaned_toronto_shelters.csv"
)


#### Explore ####
toronto_shelters_clean <-
  read_csv(
    "cleaned_toronto_shelters.csv",
    show_col_types = FALSE
  )


toronto_shelters_clean <- toronto_shelters_clean %>%
  mutate(Month = floor_date(as.Date(OCCUPANCY_DATE), "month"))

monthly_beds <- toronto_shelters_clean %>%
  group_by(Month, LOCATION_CITY) %>%
  summarize(Total_Beds = sum(OCCUPIED_BEDS, na.rm = TRUE))

ggplot(monthly_beds, aes(x = Month, y = Total_Beds, fill = LOCATION_CITY)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  labs(x = "Month", y = "Total Occupied Beds", fill = "City") +
  scale_x_date(date_breaks = "1 month", date_labels = "%b")