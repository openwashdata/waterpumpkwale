## code to prepare `data-processing` dataset goes here

# read data
weeklyvol2014 <- readxl::read_excel("./data-raw/WDT_Weekly_Volume_ARCH.xlsx", sheet = 1)
weeklyvol2015 <- readxl::read_excel("./data-raw/WDT_Weekly_Volume_ARCH.xlsx", sheet = 2)
location <- readxl::read_excel("./data-raw/WDT_Weekly_Volume_ARCH.xlsx", sheet = 3)

# tidy column names
colnames(location) <- c("pumpid", "description", "x_arc1960", "y_arc1960", "lat_wgs84", "long_wgs84")
weeklyvol2014 <- weeklyvol2014 |> dplyr::rename(pumpid=PumpID)
weeklyvol2015 <- weeklyvol2015 |> dplyr::rename(pumpid=PumpID)
# export data to R
usethis::use_data(weeklyvol2014, weeklyvol2015, location, overwrite = TRUE)

# export to extdata
## write to csv files
readr::write_csv(location, here::here("inst", "extdata", "location.csv"))
readr::write_csv(weeklyvol2014, here::here("inst", "extdata", "weeklyvol2014.csv"))
readr::write_csv(weeklyvol2015, here::here("inst", "extdata", "weeklyvol2015.csv"))
## write to excel files
openxlsx::write.xlsx(location, here::here("inst", "extdata", "location.xlsx"))
openxlsx::write.xlsx(weeklyvol2014, here::here("inst", "extdata", "weeklyvol2014.xlsx"))
openxlsx::write.xlsx(weeklyvol2015, here::here("inst", "extdata", "weeklyvol2015.xlsx"))
