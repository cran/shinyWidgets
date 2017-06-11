
library("shiny")
library("shinyWidgets")

ui <- fluidPage(
  tags$h2("dropdown button"),
  fluidRow(
    column(
      width = 4, offset = 2,
      dropdownButton("with size = 'xs'", circle = TRUE, status = "default", size = "xs", icon = icon("question")),
      dropdownButton("with size = 'sm'", circle = TRUE, status = "default", size = "sm", icon = icon("question-sign", lib = "glyphicon")),
      dropdownButton("with size = 'default'", circle = TRUE, status = "default", size = "default", icon = icon("question-sign", lib = "glyphicon")),
      dropdownButton("with size = 'lg'", circle = TRUE, status = "default", size = "lg", icon = icon("question-sign", lib = "glyphicon"))
    ),
    column(
      width = 4,
      dropdownButton("with size = 'xs'", circle = FALSE, label = "Info", status = "default", size = "xs", icon = icon("question")),
      dropdownButton("with size = 'sm'", circle = FALSE, label = "Info", status = "default", size = "sm", icon = icon("question-sign", lib = "glyphicon")),
      dropdownButton("with size = 'default'", circle = FALSE, label = "Info", status = "default", size = "default", icon = icon("question-sign", lib = "glyphicon")),
      dropdownButton("with size = 'lg'", circle = FALSE, label = "Info", status = "default", size = "lg", icon = icon("question-sign", lib = "glyphicon"))
    )
  )
)

server <- function(input, output, session) {

}

shinyApp(ui = ui, server = server)
