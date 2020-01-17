#' @export

add_team_long <- function(df) {

  team_names %>%
    select(team, team_long) %>%
    right_join(df, by = "team")

}
