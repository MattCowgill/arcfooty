#' Add The Arc logo and URL footer to a ggplot2 plot
#'
#' @param plot ggplot2 chart to which a footer should be appended. Default is
#' `ggplot2::last_plot()`
#'
#' @export
#' @importFrom ggplot2 last_plot
#' @import patchwork

add_arc_footer <- function(plot = ggplot2::last_plot()) {

  if (inherits(plot, "arc_footer_plot")) {
    return(plot)
  } else {
    return(append_arc_footer(plot))
  }
}

# Internal function to actually add the footer
append_arc_footer <- function(plot) {

  user_plot <- plot

  # Define a blank plot to be used as a plot spacer
  # This doesn't leave a tiny margin, unlike patchwork::plot_spacer()
  my_spacer <- ggplot() +
    geom_blank() +
    theme_arc()

  footer_height <- 10.604

  # Note: `footer_left` and `footer_right` are internal data; see data-raw
  footer <- wrap_plots(
    wrap_elements(full = footer_left),
    my_spacer,
    wrap_elements(full = footer_right),
    ncol = 3,
    nrow = 1,
    # Note: a 'null' width object fills any space
    widths = unit(c(35.116, 1, 43.878),
                  c("mm", "null", "mm")),
    heights = unit(c(footer_height),
                   c("mm"))
  ) &
    theme(plot.background = element_rect(fill = arc_green),
          plot.margin = margin())

  ret <- wrap_plots(
    wrap_elements(full = user_plot),
    wrap_elements(full = footer),
    heights = unit(c(1, footer_height),
                   c("null", "mm")),
    ncol = 1
  ) &
    theme(plot.background = element_rect(fill = arc_green),
          plot.margin = margin())

  class(ret) <- c(class(ret), "arc_footer_plot")

  return(ret)

}
