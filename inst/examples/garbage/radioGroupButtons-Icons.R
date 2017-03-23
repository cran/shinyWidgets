

library("shiny")
library("shinyWidgets")

ui <- fluidPage(
  tags$h1("radioGroupButtons with icons", style = "color: steelblue;"),
  br(),
  radioGroupButtons(
    inputId = "id01", choices = c("A", "B", "C", "D"),
    checkIcon = list(yes = icon("ok", lib = "glyphicon"))
  ),
  verbatimTextOutput(outputId = "res01"),

  br(),

  radioGroupButtons(
    inputId = "id02", choices = c("A", "B", "C", "D"), status = "primary",
    checkIcon = list(yes = icon("ok", lib = "glyphicon"), no = icon("remove", lib = "glyphicon"))
  ),
  verbatimTextOutput(outputId = "res02"),

  br(),

  radioGroupButtons(
    inputId = "id03", choices = c("A", "B", "C", "D"),
    checkIcon = list(yes = icon("dot-circle-o"), no = icon("circle-o"))
  ),
  verbatimTextOutput(outputId = "res03"),

  br(),

  radioGroupButtons(
    inputId = "id04", choices = c("A", "B", "C", "D"), status = "success", justified = TRUE,
    checkIcon = list(yes = icon("check-square-o"), no = icon("square-o"))
  ),
  verbatimTextOutput(outputId = "res04"),

  br(),

  radioGroupButtons(
    inputId = "id05", choices = c("Option 1", "Option 2", "Option 3", "Option 4"),
    checkIcon = list(yes = tags$i(class = "fa fa-check-square", style = "color: steelblue"),
                     no = tags$i(class = "fa fa-square-o", style = "color: steelblue"))
  ),
  verbatimTextOutput(outputId = "res05"),

  br(),

  radioGroupButtons(
    inputId = "id06", choices = c("Option 1", "Option 2", "Option 3", "Option 4"), individual = TRUE,
    checkIcon = list(yes = tags$i(class = "fa fa-circle", style = "color: steelblue"),
                     no = tags$i(class = "fa fa-circle-o", style = "color: steelblue"))
  ),
  verbatimTextOutput(outputId = "res06")
)

server <- function(input, output){
  output$res01 <- renderPrint(input$id01)
  output$res02 <- renderPrint(input$id02)
  output$res03 <- renderPrint(input$id03)
  output$res04 <- renderPrint(input$id04)
  output$res05 <- renderPrint(input$id05)
  output$res06 <- renderPrint(input$id06)
}
shinyApp(ui = ui, server = server)
