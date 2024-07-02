library(tidyverse)
library(glamr)
library(gophr)

si_setup()

set_paths()

glamr::si_path(type = "path_msd") %>% list.files(pattern = "^MER.*Nigeria.zip$")

df_msd <- glamr::si_path(type = "path_msd") %>%
  return_latest(pattern = "PSNU_IM.*Nigeria") %>%
  read_psd()

df_msd %>% glimpse()

df_msd %>% distinct(fiscal_year)

df_msd %>%
  filter(fiscal_year == 2024,
         indicator == "TX_CURR",
         standardizeddisaggregate == "Total Numerator") %>%
  clipr::write_clip()

df_msd %>%
  filter(fiscal_year == 2024,
         funding_agency == "USAID",
         indicator == "TX_CURR",
         standardizeddisaggregate == "Total Numerator") %>%
  distinct(prime_partner_name) %>%
  pull() %>%
  sort() %>%
  clipr::write_clip()

# ACHIEVING HEALTH NIGERIA INITIATIVE
# CENTER FOR CLINICAL CARE AND CLINICAL RESEARCH LTD GTE
# EXCELLENCE COMMUNITY EDUCATION  WELFARE SCHEME (ECEWS)
# GEORGETOWN GLOBAL HEALTH NIGERIA LTD/GTE
# HEARTLAND ALLIANCE LTD-GTE
# HSCL
# JHPIEGO CORPORATION
# SOCIETY FOR FAMILY HEALTH



glamr::si_path(type = "path_vector") %>%
  list.files(pattern = ".*nigeria.shp$|.*nigeria_snu1.shp$",
             recursive = TRUE)




