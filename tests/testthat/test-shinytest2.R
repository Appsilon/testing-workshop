library(shinytest2)

test_that("{shinytest2} recording: testing-workshop", {
  app <- AppDriver$new(variant = platform_variant(), name = "testing-workshop", height = 821, 
      width = 1139)
  app$set_inputs(`app-region` = "Europe")
  app$expect_values()
  app$expect_screenshot()
})
