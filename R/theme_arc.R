#' Style ggplot2 charts in the The Arc way
#'
#'
#' @param base_size base font size
#' @param base_family base font family; default is "Lato". A warning will be
#' shown if Lato not available to R.
#' @param base_line_size base size for line elements
#' @param base_rect_size base size for rect elements; default is 0
#'
#' @examples
#'
#' library(ggplot2)
#'
#' \donttest{
#' p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
#'       geom_point() +
#'       theme_arc()
#'
#' p
#' }
#'
#' @import extrafont
#' @import ggplot2
#' @export
#'

theme_arc <- function(base_size = 12,
                      base_family = "Lato",
                      base_line_size = base_size / 22,
                      base_rect_size = 0) {

  font_is_available <- check_font_available(base_family)

  if (isFALSE(font_is_available)) {
    base_family <- "sans"
  }

  half_line <- base_size / 2

  theme_grey(base_size = base_size,
             base_family = base_family,
             base_line_size = base_line_size,
             base_rect_size = base_rect_size) %+replace%
  theme(
    line = element_line(
      colour = arc_dark_grey,
      size = base_line_size,
      linetype = 1,
      lineend = "butt"
    ),
    rect = element_rect(
      fill = arc_green,
      colour = arc_dark_grey,
      size = base_rect_size,
      linetype = 1
    ),
    text = element_text(
      family = base_family,
      face = "plain",
      colour = arc_dark_grey,
      size = base_size,
      lineheight = 0.8,
      hjust = 0.5,
      vjust = 0.5,
      angle = 0,
      margin = margin(),
      debug = FALSE
    ),
    axis.line = element_blank(),
    axis.line.x = NULL,
    axis.line.y = NULL,
    axis.text = element_text(size = rel(0.8),
                             colour = "grey30"),
    axis.text.x = element_text(margin = margin(t = 0.8 *
                                                 half_line /
                                                 2), vjust = 1),
    axis.text.x.top = element_text(margin = margin(b = 0.8 *
                                                     half_line /
                                                     2), vjust = 0),
    axis.text.y = element_text(margin = margin(r = 0.8 *
                                                 half_line /
                                                 2), hjust = 1),
    axis.text.y.right = element_text(margin = margin(l = 0.8 *
                                                       half_line /
                                                       2), hjust = 0),
    axis.ticks = element_blank(),
    axis.ticks.length = unit(half_line / 2, "pt"),
    axis.ticks.length.x = NULL,
    axis.ticks.length.x.top = NULL,
    axis.ticks.length.x.bottom = NULL,
    axis.ticks.length.y = NULL,
    axis.ticks.length.y.left = NULL,
    axis.ticks.length.y.right = NULL,
    axis.title = element_text(size = rel(0.9)),
    axis.title.x = element_text(margin = margin(t = half_line / 2),
                                vjust = 1),
    axis.title.x.top = element_text(margin = margin(b = half_line / 2),
                                    vjust = 0),
    axis.title.y = element_text(
      angle = 0,
      margin = margin(r = half_line),
      vjust = 0.5
    ),
    axis.title.y.right = element_text(
      angle = -90,
      margin = margin(l = half_line /
                        2),
      vjust = 0
    ),
    legend.background = element_blank(),
    legend.spacing = unit(2 * half_line, "pt"),
    legend.spacing.x = NULL,
    legend.spacing.y = NULL,
    legend.margin = margin(half_line,
                           half_line, half_line, half_line),
    legend.key = element_rect(fill = "grey95",
                              colour = NA),
    legend.key.size = unit(1.2, "lines"),
    legend.key.height = unit(0, "cm"),
    legend.key.width = NULL,
    legend.text = element_text(size = rel(0.8)),
    legend.text.align = NULL,
    legend.title = element_blank(),
    legend.title.align = NULL,
    legend.position = "bottom",
    legend.direction = "horizontal",
    legend.justification = "center",
    legend.box = "vertical",
    legend.box.margin = margin(0, 0,
                               0, 0, "cm"),
    legend.box.background = element_blank(),
    legend.box.spacing = unit(2 * half_line, "pt"),
    panel.background = element_rect(),
    panel.border = element_blank(),
    panel.grid = element_line(colour = "gray90", size = base_line_size * 0.8),
    panel.grid.minor = element_blank(),
    panel.spacing = unit(half_line,
                         "pt"),
    panel.spacing.x = NULL,
    panel.spacing.y = NULL,
    panel.ontop = FALSE,
    strip.background = element_rect(),
    strip.text = element_text(
      colour = "grey10",
      size = rel(0.8),
      margin = margin(0.8 * half_line,
                      0.8 * half_line, 0.8 * half_line, 0.8 * half_line)
    ),
    strip.text.x = NULL,
    strip.text.y = element_text(angle = -90),
    strip.placement = "inside",
    strip.placement.x = NULL,
    strip.placement.y = NULL,
    strip.switch.pad.grid = unit(half_line / 2,
                                 "pt"),
    strip.switch.pad.wrap = unit(half_line / 2,
                                 "pt"),
    plot.background = element_rect(colour = "white"),
    plot.title = element_text(
      face = "bold",
      size = rel(1.5),
      hjust = 0,
      vjust = 1,
      margin = margin(b = half_line)
    ),
    plot.title.position = "plot",
    plot.subtitle = element_text(
      hjust = 0,
      vjust = 1,
      margin = margin(b = base_size)
    ),
    plot.caption = element_text(
      size = rel(0.67),
      hjust = 0,
      vjust = 1,
      margin = margin(t = half_line)
    ),
    plot.caption.position = "plot",
    plot.tag = element_text(
      size = rel(1.2),
      hjust = 0.5,
      vjust = 0.5
    ),
    plot.tag.position = "topleft",
    plot.margin = margin(half_line,
                         half_line, half_line, half_line),
    complete = TRUE
  )

}


check_font_available <- function(font = "Lato") {
  font_available <- font %in% extrafont::fonts()

  if (isFALSE(font_available)) {
    warning(font, " font not available; using `sans`.")
  }

  invisible(font_available)
}
