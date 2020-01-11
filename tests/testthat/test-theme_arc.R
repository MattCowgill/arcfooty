context("visual unit test of theme_arc()")

base_scatterplot <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  theme_arc() +
  labs(title = "Title",
       subtitle = "Subtitle",
       caption = "Caption")


test_that("scatterplots without colour look correct", {
    vdiffr::expect_doppelganger("plain scatterplot with no colour",
                                base_scatterplot)
})


test_that("simple plot with footer looks correct", {
    vdiffr::expect_doppelganger("scatterplot with footer",
                                add_arc_footer(base_scatterplot))

})
