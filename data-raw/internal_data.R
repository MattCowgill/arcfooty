library(grid)
library(png)
library(usethis)
library(tibble)

# Logo and footer -----

png_to_grob <- function(path) {

  image <- png::readPNG(source = path)

  grob <- grid::rasterGrob(image)

  grob
}

footer_left <- png_to_grob("data-raw/footer_left.png")
footer_right <- png_to_grob("data-raw/footer_right.png")

# Colours -----

arc_green <- "#f0f7ee"

arc_dark_grey <- "#333333"

# Chart types -----

chart_types <- tibble::tribble(
  ~type,   ~height,
  "normal", 103.18756,
  "tall",       127,
  "very_tall",   169.333,
  "extremely_tall",   206.375
)

# Save data -----

usethis::use_data(footer_left,
                  footer_right,
                  arc_green,
                  arc_dark_grey,
                  chart_types,
                  internal = TRUE,
                  overwrite = TRUE)
