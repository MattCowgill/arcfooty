p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  theme_arc() +
  labs(title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")

test_file_exists <- function(type, func_name) {

  filename <- paste0("test_", type, ".png")

  do.call(what = func_name,
          args = list(
            filename = filename,
            object = p,
            type = type
          ))

  expect_true(file.exists(filename))

  unlink(filename)

}

test_that("each save type works", {

  lapply(arcfooty:::chart_types$type,
       test_file_exists,
       func_name = "arc_save")

})

