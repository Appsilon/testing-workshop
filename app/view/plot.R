box::use(
  graphics[barplot],
)
box::use(../logic/data)

#' @export
generate_plot <- function(region) {
  barplot(
    data$get_column_multiplied(datasets::WorldPhones, region),
    main = region,
    ylab = "Number of Telephones",
    xlab = "Year"
  )
}
