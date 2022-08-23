test_that("negReviews works correctly", {

  skip_on_cran()

  test_review <- negReviews(game_id = 50)

  expect_type(test_review,
            "list")

})

test_that("negReviews no reviews fails correctly", {

  expect_error(
    negReviews(game_id = 1)
  )

})


test_that("negReviews wrong number fails correctly", {

  expect_error(
   negReviews(game_id = 112865391872356)
    )

})
