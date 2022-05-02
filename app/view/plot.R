box::use(
  graphics[barplot],
)
box::use(../logic/prepare)

#' @export
generate_plot <- function(region) {
  barplot(
    prepare$get_column_multiplied(datasets::WorldPhones, region),
    main = region,
    ylab = "Number of Telephones",
    xlab = "Year"
  )
}
