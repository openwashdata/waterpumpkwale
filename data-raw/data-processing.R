## code to prepare `data-processing` dataset goes here

# read data
weeklyvol2014 <- readxl::read_excel("./data-raw/WDT_Weekly_Volume_ARCH.xlsx", sheet = 1)
weeklyvol2015 <- readxl::read_excel("./data-raw/WDT_Weekly_Volume_ARCH.xlsx", sheet = 2)
location <- readxl::read_excel("./data-raw/WDT_Weekly_Volume_ARCH.xlsx", sheet = 3)

# export data to R
usethis::use_data(weeklyvol2014, weeklyvol2015, location, overwrite = TRUE)

