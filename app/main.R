box::use(
  shiny[...],
  graphics[barplot],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  fluidPage(
    titlePanel("Telephones by region"),
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
    output$phonePlot <- renderPlot({
      barplot(datasets::WorldPhones[,input$region]*1000, 
              main = input$region,
              ylab = "Number of Telephones",
              xlab = "Year")
    })
  })
}
