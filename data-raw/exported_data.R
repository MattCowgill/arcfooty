library(tidyverse)

# Exported data

# Team colours -------

team_cols <- c(
  "WC" = "#053388",
  "FR" = "#5d368f",
  "BL" = "#6f263d",
  "FI" = "#6f263d",
  "GC" = "#e4002b",
  "GW" = "#fe5000",
  "SY" = "#c8102e",
  "PA" = "#1C92AF",
  "AD" = "#002a6f",
  "CA" = "#041c2c",
  "SK" = "#EA2134",
  "ME" = "#041c2c",
  "KA" = "#001489",
  "WB" = "#0033a0",
  "ES" = "#da291c",
  "HW" = "#4f2c1d",
  "CW" = "black",
  "RI" = "#e6b843",
  "GE" = "#0c2340",
  "UN" = "black"
)


# Team names -----

team_names <- tibble::tribble(
                ~team,         ~team_long,     ~espn_team_long, ~espn_team,
                 "AD",         "Adelaide",          "Adelaide",     "ADEL",
                 "BL",         "Brisbane",    "Brisbane Lions",       "BL",
                 "CA",          "Carlton",           "Carlton",     "CARL",
                 "CW",      "Collingwood",       "Collingwood",     "COLL",
                 "ES",         "Essendon",          "Essendon",      "ESS",
                 "FR",        "Fremantle",         "Fremantle",      "FRE",
                 "GE",          "Geelong",           "Geelong",     "GEEL",
                 "HW",         "Hawthorn",          "Hawthorn",      "HAW",
                 "KA",  "North Melbourne",   "North Melbourne",     "NMFC",
                 "ME",        "Melbourne",         "Melbourne",     "MELB",
                 "PA",    "Port Adelaide",     "Port Adelaide",     "PORT",
                 "RI",         "Richmond",          "Richmond",     "RICH",
                 "SK",         "St Kilda",          "St Kilda",      "STK",
                 "SY",           "Sydney",      "Sydney Swans",      "SYD",
                 "WC",       "West Coast", "West Coast Eagles",      "WCE",
                 "WB", "Western Bulldogs",  "Western Bulldogs",       "WB",
                 "GC",       "Gold Coast",        "Gold Coast",     "GCFC",
                 "GW",       "GWS Giants",        "GWS Giants",      "GWS",
                 "UN",       "University",        "University",     "UNIV",
                 "FI",          "Fitzroy",     "Fitzroy Lions",     "FITZ"
                )



usethis::use_data(team_cols, team_names, overwrite = TRUE)
