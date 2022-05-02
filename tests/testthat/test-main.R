box::use(
  shiny[testServer],
  testthat[...],
)
box::use(
  app/main[...],
)

test_that("main server works", {
  testServer(server, {
    session$setInputs(region = "Oceania")
    expect_true(
      grepl("Telephones by region: Oceania", output$title$html)
    )
  })
})
