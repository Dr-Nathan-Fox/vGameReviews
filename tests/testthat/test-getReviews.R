test_that("getReviews works correctly", {

  skip_on_cran()

  test_review <- getReviews(game_id = 782410)

  expect_type(test_review,
            "list")

})

test_that("getReviews no reviews fails correctly", {

  expect_error(
    getReviews(game_id = 1)
  )

})


test_that("getReviews wrong number fails correctly", {

  expect_error(
    getReviews(game_id = 112865391872356)
    )

})
