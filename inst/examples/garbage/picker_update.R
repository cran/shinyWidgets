

library("shiny")
library("shinyWidgets")



shinyWidgets:::pickerOptions(
  choices = shinyWidgets:::choicesWithNames(c("a", "b", "c", "d")), choicesOpt = list(subtext = paste0("(", 1:4, ")"))
)




ui <- fluidPage(
  tags$h1("Test update select picker !"),
  br(),

  tags$h3("Update selected"),
  fluidRow(
    column(
      width = 3,
      pickerInput(inputId = "id1", label = "Default", choices = c("a", "b", "c", "d"), multiple = TRUE),
      verbatimTextOutput(outputId = "res1")
    ),
    column(
      width = 3,
      pickerInput(inputId = "up1", label = "Update picker to the left", choices = c("None", "a", "b", "c", "d"), multiple = TRUE)
    )
  ),

  br(),

  tags$h3("Update choices"),
  fluidRow(
    column(
      width = 3,
      pickerInput(inputId = "id2", label = "Default", choices = c("a", "b", "c", "d"), multiple = TRUE)
    ),
    column(
      width = 3,
      pickerInput(inputId = "up3", label = "Update picker to the left", choices = c("None", "a", "b", "c", "d"), multiple = TRUE)
    )
  )
)

server <- function(input, output, session) {

  output$res1 <- renderPrint({
    input$id1
  })

  observeEvent(input$up1, {
    if ("None" %in% input$up1) {
      x <- NULL
    } else {
      x <- input$up1
    }
    updatePickerSelect(session = session, inputId = "id1", selected = x)
  })

}

shinyApp(ui = ui, server = server)

