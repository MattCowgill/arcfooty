
test_that("multiplication works", {

  arc_team <- arcfooty::team_names[ , "team"]

  arc_team <- arcfooty::add_team_long(arc_team)

  expect_match(arc_team$team_long[arc_team$team == "WC"], "West Coast")

  expect_equal(!is.na(arc_team$team_long),
               rep(TRUE, 20))
})
