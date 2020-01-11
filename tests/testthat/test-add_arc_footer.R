base_plot <- p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  theme_arc()

test_that("footer is never added more than once", {
  p1 <- add_arc_footer(base_plot)
  p2 <- add_arc_footer(p1)

  expect_identical(p1, p2)
})
