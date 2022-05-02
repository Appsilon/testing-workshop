box::use(
  data.validator[...],
  assertr[...],
  testthat[...],
)

test_that("WorldPhones follows assumptions in the app", {
  dataset <- data.frame(datasets::WorldPhones)
  report <- data_validation_report()
  
  validate(dataset, name = "WorldPhones dataset") %>% 
    validate_if(has_all_names("N.Amer", "Europe", "Asia", "S.Amer", "Oceania", "Africa", "Mid.Amer")) %>% 
    validate_cols(within_bounds(0, Inf), everything(), description = "All values are positive") %>% 
    validate_cols(assertr::not_na, everything(), description = "No missing values") %>% 
    add_results(report)
  
  validations <- report$get_validations()
  
  expect_true(all(validations$type == "success"))
})
