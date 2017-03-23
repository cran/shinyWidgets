

library("shiny")
library("shinyWidgets")
ui <- fluidPage(
  tags$h1("Fav button"),
  # shiny::icon("users"),
  br(),
  favButton(inputId = "test01"),
  verbatimTextOutput("res01"),
  br(),
  fluidRow(
    column(
      width = 6,
      favButton(inputId = "test02", size = "large"),
      verbatimTextOutput("res02")
    ),
    column(
      width = 6,
      favButton(inputId = "test02b", type = "star", size = "large"),
      verbatimTextOutput("res02b")
    )
  ),
  br(),
  favButton(inputId = "test03", size = "large", status = "primary"),
  verbatimTextOutput("res03"),
  br(),

  fluidRow(
    column(
      width = 1, ""
    ),
    column(
      width = 3,
      favButton(inputId = "test04", size = "large", animated = TRUE),
      verbatimTextOutput("res04")
    ),
    column(
      width = 3,
      favButton(inputId = "test05", size = "large", animated = TRUE),
      verbatimTextOutput("res05")
    ),
    column(
      width = 3,
      favButton(inputId = "test06", size = "large", animated = 5),
      verbatimTextOutput("res06")
    )
  ),
  br(),
  fluidRow(
    column(
      width = 1, ""
    ),
    column(
      width = 3,
      favButton(inputId = "test07", size = "large", animated = 8),
      verbatimTextOutput("res07")
    ),
    column(
      width = 3,
      favButton(inputId = "test08", size = "large", animated = 16),
      verbatimTextOutput("res08")
    ),
    column(
      width = 3,
      ""
    )
  )
)
server <- function(input, output){

  output$res01 <- renderPrint({
    input$test01
  })

  output$res02 <- renderPrint({
    input$test02
  })

  output$res02b <- renderPrint({
    input$test02b
  })

  output$res03 <- renderPrint({
    input$test03
  })

  output$res04 <- renderPrint({
    input$test04
  })

  output$res05 <- renderPrint({
    input$test05
  })

  output$res06 <- renderPrint({
    input$test06
  })

  output$res07 <- renderPrint({
    input$test07
  })

  output$res08 <- renderPrint({
    input$test08
  })

}
shinyApp(ui = ui, server = server)
