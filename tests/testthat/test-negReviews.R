test_that("posReviews works correctly", {

  skip_on_cran()

  test_review <- posReviews(game_id = 50)

  expect_type(test_review,
            "list")

})

test_that("posReviews no reviews fails correctly", {

  expect_error(
    posReviews(game_id = 1)
  )

})


test_that("posReviews wrong number fails correctly", {

  expect_error(
   posReviews(game_id = 112865391872356)
    )

})
