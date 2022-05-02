box::use(
  shiny[...],
  graphics[barplot],
  glue[glue]
)
box::use(view/plot)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluidPage(
    uiOutput(ns("title")),
    sidebarLayout(      
      sidebarPanel(
        selectInput(ns("region"), "Region:", 
                    choices = colnames(datasets::WorldPhones)),
        hr(),
        helpText("Data from AT&T (1961) The World's Telephones.")
      ),
      mainPanel(
        plotOutput(ns("phonePlot"))
      )
    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$title <- renderUI({
      titlePanel(
        glue("Telephones by region: {input$region}")
      )
    })
    output$phonePlot <- renderPlot({
      plot$generate_plot(input$region)
    })
  })
}
