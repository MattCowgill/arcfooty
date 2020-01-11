library(grid)
library(png)
library(usethis)

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

# Save data -----

usethis::use_data(footer_left,
                  footer_right,
                  arc_green,
                  arc_dark_grey,
                  internal = TRUE,
                  overwrite = TRUE)
