library(grid)
library(png)
library(usethis)

png_to_grob <- function(path) {

  image <- png::readPNG(source = path)

  grob <- grid::rasterGrob(image)

  grob
}

footer_left <- png_to_grob("data-raw/footer_left.png")
footer_right <- png_to_grob("data-raw/footer_right.png")


usethis::use_data(footer_left,
                  footer_right,
                  internal = TRUE,
                  overwrite = TRUE)
