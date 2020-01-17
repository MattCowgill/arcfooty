#' Add a column containing long team names to a dataframe with a `team` column
#'
#' @param df A dataframe containing a column called `team` with short
#' (two-character) team names, as in `arcfooty::team_names`
#'
#'
#' @importFrom dplyr select right_join %>%
#' @name add_team_long
#' @export

add_team_long <- function(df) {

  team <- NULL
  team_long <- NULL

  arcfooty::team_names %>%
    select(team, team_long) %>%
    right_join(df, by = "team")

}
