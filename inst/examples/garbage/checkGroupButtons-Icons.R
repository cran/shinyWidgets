

library("shiny")
library("shinyWidgets")

ui <- fluidPage(
  tags$h1("checkboxGroupButtons with icons", style = "color: steelblue;"),
  br(),
  checkboxGroupButtons(
    inputId = "id01", choices = c("A", "B", "C", "D"),
    checkIcon = list(yes = icon("ok", lib = "glyphicon"))
  ),
  verbatimTextOutput(outputId = "res01"),

  br(),

  checkboxGroupButtons(
    inputId = "id02", choices = c("A", "B", "C", "D"), status = "primary",
    checkIcon = list(yes = icon("ok", lib = "glyphicon"), no = icon("remove", lib = "glyphicon"))
  ),
  verbatimTextOutput(outputId = "res02"),
  tags$p("Click to update :"),
  actionGroupButtons(inputIds = c("upA", "upB", "upC", "upD"), labels = c("A", "B", "C", "D")),

  br(),br(),br(),

  checkboxGroupButtons(
    inputId = "id03", choices = c("A", "B", "C", "D"),
    checkIcon = list(yes = icon("dot-circle-o"), no = icon("circle-o"))
  ),
  verbatimTextOutput(outputId = "res03"),

  br(),

  checkboxGroupButtons(
    inputId = "id04", choices = c("A", "B", "C", "D"), status = "success", justified = TRUE,
    checkIcon = list(yes = icon("check-square-o"), no = icon("square-o"))
  ),
  verbatimTextOutput(outputId = "res04"),

  br(),

  checkboxGroupButtons(
    inputId = "id05", choices = c("Option 1", "Option 2", "Option 3", "Option 4"),
    checkIcon = list(yes = tags$i(class = "fa fa-check-square", style = "color: steelblue"),
                     no = tags$i(class = "fa fa-square-o", style = "color: steelblue"))
  ),
  verbatimTextOutput(outputId = "res05"),

  br(),

  checkboxGroupButtons(
    inputId = "id06", choices = c("Option 1", "Option 2", "Option 3", "Option 4"), individual = TRUE,
    checkIcon = list(yes = tags$i(class = "fa fa-circle", style = "color: steelblue"),
                     no = tags$i(class = "fa fa-circle-o", style = "color: steelblue"))
  ),
  verbatimTextOutput(outputId = "res06")
)

server <- function(input, output, session){
  output$res01 <- renderPrint(input$id01)
  output$res02 <- renderPrint(input$id02)
  output$res03 <- renderPrint(input$id03)
  output$res04 <- renderPrint(input$id04)
  output$res05 <- renderPrint(input$id05)
  output$res06 <- renderPrint(input$id06)


  observeEvent(input$upA, {
    updateCheckboxGroupButtons(session = session, inputId = "id02", selected = "A")
  })
  observeEvent(input$upB, {
    updateCheckboxGroupButtons(session = session, inputId = "id02", selected = "B")
  })
  observeEvent(input$upC, {
    updateCheckboxGroupButtons(session = session, inputId = "id02", selected = "C")
  })
  observeEvent(input$upD, {
    updateCheckboxGroupButtons(session = session, inputId = "id02", selected = "D")
  })
}
shinyApp(ui = ui, server = server)
