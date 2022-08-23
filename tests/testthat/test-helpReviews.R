test_that("helpReviews works correctly", {

  skip_on_cran()

  test_review <- helpReviews(game_id = 50)

  expect_type(test_review,
            "list")

})


test_that("helpReviews no reviews fails correctly", {

  expect_error(
    helpReviews(game_id = 1)
  )

})


test_that("posReviews wrong number fails correctly", {

  expect_error(
   helpReviews(game_id = 112865391872356)
    )

})


test_that("posReviews wrong day fails correctly", {

  expect_error(
    helpReviews(game_id = 40,
                day_range = 999)
  )

})

