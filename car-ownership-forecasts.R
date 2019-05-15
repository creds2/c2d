# Aim: get data estimating car ownership

library(tidyverse)

# source https://www.gov.uk/government/statistical-data-sets/veh02-licensed-cars
u = "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/794473/veh0202.ods"
f = file.path(tempdir(), "veh0202.ods")
download.file(u, f)
d = readODS::read_ods(f, skip = 8)
d[1:9, ]
d$Year # last entry: 27
car_ownership = d %>% 
  slice(2:26) %>% 
  mutate_all(as.numeric) %>% 
  mutate(Total = Total / 1e3) %>% 
  select(Year, Total) %>% 
  mutate(Scenario = "Observed")

# from https://twitter.com/robinlovelace/status/1128604064290414592
natcop_total_low = 38 
natcop_total_high = 40.5 
zero_growth = car_ownership$Total[nrow(car_ownership)]
car_natcop = tibble(
  Year = c(2018, 2018, 2018, 2050, 2050, 2050),
  Total = c(
    rep(zero_growth, 3),
    natcop_total_low, natcop_total_high, zero_growth
    ),
  Scenario = rep(c("NATCOP low", "NATCOP high", "Zero growth"), 2)
)

car_ownership = bind_rows(car_ownership, car_natcop)

ggplot(car_ownership) +
  geom_line(aes(Year, Total, color = Scenario)) +
  scale_x_continuous(limits = c(NA, 2050)) 

# -------------------------------------------------------------------------

