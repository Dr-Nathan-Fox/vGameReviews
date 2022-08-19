test_that("gameList works correctly", {

  skip_on_cran()

  test_list <- gameList()

  expect_type(test_list,
            "list")

})
