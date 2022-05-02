#' @export
get_column_multiplied <- function(matrix, column, multiplier = 1000) {
  matrix[,column] * multiplier
}
