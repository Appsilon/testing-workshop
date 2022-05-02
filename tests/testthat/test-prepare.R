box::use(
  shiny[testServer],
  testthat[...],
)
box::use(
  app/logic/prepare[...],
)

test_that("get_column_multiplied returns column by name in matrix", {
  matrix <- datasets::WorldPhones
  selected_column <- sample(colnames(matrix), 1)
  expect_equal(
    matrix[,selected_column],
    get_column_multiplied(matrix, selected_column, 1)
  )
})

test_that("get_column_multiplied returns column multiplied by given value", {
  matrix <- datasets::WorldPhones
  selected_column <- sample(colnames(matrix), 1)
  random_value <- sample(1:100, 1)
  expect_equal(
    matrix[,selected_column] * random_value,
    get_column_multiplied(matrix, selected_column, random_value)
  )
})

test_that("get_column_multiplied returns column multiplied by 1000 by default", {
  matrix <- datasets::WorldPhones
  selected_column <- sample(colnames(matrix), 1)
  expect_equal(
    matrix[,selected_column] * 1000,
    get_column_multiplied(matrix, selected_column)
  )
})
