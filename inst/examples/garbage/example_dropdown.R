
library("shiny")
library("shinyWidgets")

ui <- fluidPage(
  tags$h1("Example of dropdown menu"),
  br(),
  dropdownButton(
    tags$h3("List of Input"),
    selectizeInput(
      inputId = "s", label = "Select", choices = letters, multiple = TRUE,
      options = list(placeholder = 'a letter or several', onInitialize = I('function() { this.setValue(""); }'))
    ),
    sliderInput(inputId = "n", label = "N", min = 0.1, max = 8, value = c(0.8, 6)),
    br(),
    sliderInput(inputId = "n2", label = "N2", min = 2, max = 8, value = 4),
    circle = TRUE, status = "primary", icon = icon("gear"),
    tooltip = tooltipOptions(title = "Click to see inputs !")
  ),
  verbatimTextOutput(outputId = "vals")
)
server <- function(input, output){
  output$vals <- renderPrint({
    print(input$s); print(input$n); print(input$n2)
  })
}
shinyApp(ui = ui, server = server)
