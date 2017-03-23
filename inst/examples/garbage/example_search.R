

library("shiny")
library("shinyWidgets")

ui <- fluidPage(
  tags$h1("Search Input"),
  tags$p("A text input which actualize the value server-side if the user hit 'Enter' or click button."),
  br(),
  searchInput(
    inputId = "search", label = "Enter your text",
    placeholder = "A placeholder",
    btnSearch = icon("search"),
    btnReset = icon("remove"),
    width = "450px"
  ),
  br(),
  verbatimTextOutput(outputId = "res")
)

server <- function(input, output, session) {
  output$res <- renderPrint({
    input$search
  })
}

shinyApp(ui = ui, server = server)
