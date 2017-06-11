

library("shiny")
library("shinyWidgets")

ui <- fluidPage(

  tags$h2("circle button"),

  fluidRow(
    column(
      width = 3,
      circleButton(inputId = "test1", icon = icon("gears"), size = "xs")
    ),
    column(
      width = 3,
      circleButton(inputId = "test1", icon = icon("cog", lib = "glyphicon"), size = "sm")
    ),
    column(
      width = 3,
      circleButton(inputId = "test1", icon = icon("cog", lib = "glyphicon"), size = "default")
    ),
    column(
      width = 3,
      circleButton(inputId = "test1", icon = icon("cog", lib = "glyphicon"), size = "lg")
    )
  ),

  tags$h2("dropdown button"),
  fluidRow(
    column(
      width = 4, offset = 2,
      dropdownButton("with size = 'xs'", circle = TRUE, status = "default", size = "xs", icon = icon("question")),

      br(), br(), br(),

      dropdownButton("with size = 'sm'", circle = TRUE, status = "default", size = "sm", icon = icon("question-sign", lib = "glyphicon")),

      br(), br(), br(),

      dropdownButton("with size = 'default'", circle = TRUE, status = "default", size = "default", icon = icon("question-sign", lib = "glyphicon")),

      br(), br(), br(),

      dropdownButton("with size = 'lg'", circle = TRUE, status = "default", size = "lg", icon = icon("question-sign", lib = "glyphicon"))
    ),

    column(
      width = 4,
      dropdownButton("with size = 'xs'", circle = FALSE, label = "Info", status = "default", size = "xs", icon = icon("question")),

      br(), br(), br(),

      dropdownButton("with size = 'sm'", circle = FALSE, label = "Info", status = "default", size = "sm", icon = icon("question-sign", lib = "glyphicon")),

      br(), br(), br(),

      dropdownButton("with size = 'default'", circle = FALSE, label = "Info", status = "default", size = "default", icon = icon("question-sign", lib = "glyphicon")),

      br(), br(), br(),

      dropdownButton("with size = 'lg'", circle = FALSE, label = "Info", status = "default", size = "lg", icon = icon("question-sign", lib = "glyphicon"))
    )
  )
)

server <- function(input, output, session) {

}

shinyApp(ui = ui, server = server)


