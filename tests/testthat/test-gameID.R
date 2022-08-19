test_that("gameID works correctly", {

  skip_on_cran()

  test_game <- gameID("Halo")

  expect_type(test_game,
            "list")

})
