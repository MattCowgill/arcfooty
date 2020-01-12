#' Save ggplot2 plots in the right size
#'
#' @param filename Name of the file the save, including extension.
#' @param object ggplot2 object to save.
#' @param width 169.333
#' @param type Chart type (ie. height). Options include:
#' \itemize{ \item{"normal"}{ The default. 103.18756mm}
#'           \item{"tall"}{ 127mm}
#'           \item{"very_tall"}{ 169.333mm}
#'           \item{"extremely_tall"}{ 206.375mm}
#' }
#' @param height NULL by default. When non-null,
#' overrides the value set by 'type'.
#'
#' @importFrom ggplot2 ggsave last_plot
#' @name arc_save
#' @export
arc_save <-
  function(filename,
           object = ggplot2::last_plot(),
           width = 169.333,
           type = "normal",
           height = NULL) {

    if (!is.null(height)) {
      if(!is.null(type)) {
        warning("`type` and `height` both specified; ignoring `type`.")
      }
      plot_height <- height
    } else {
      plot_height <- chart_types$height[chart_types$type == type]
    }

    # Add footer if not already present
    plot <- add_arc_footer(object)

    # Save image
    ggsave(
      filename,
      plot,
      width = width,
      height = plot_height,
      units = "mm",
      dpi = 400
    )
  }

# Convenience functions to define type -----
#' @rdname arc_save
#' @export
arc_save_tall <- function(filename, object = ggplot2::last_plot()) {
  arc_save(filename = filename,
           object = object,
           type = "tall")
}

#' @rdname arc_save
#' @export
arc_save_very_tall <- function(filename, object = ggplot2::last_plot()) {
  arc_save(filename = filename,
           object = object,
           type = "very_tall")
}

#' @rdname arc_save
#' @export
arc_save_extremely_tall <- function(filename, object = ggplot2::last_plot()) {
  arc_save(filename = filename,
           object = object,
           type = "extremely_tall")
}


# Aliases with dots to preserve old code -----
#' @rdname arc_save
#' @export
arc.save <- arc_save

#' @rdname arc_save
#' @export
arc.save.tall <- arc_save_tall

#' @rdname arc_save
#' @export
arc.save.very.tall <- arc_save_very_tall

#' @rdname arc_save
#' @export
arc.save.extremely.tall <- arc_save_extremely_tall

