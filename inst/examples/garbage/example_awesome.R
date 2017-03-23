


library("shiny")
library("shinyWidgets")

ui <- fluidPage(
  tags$h1("Prettier Checkboxes And Radios", style = "color: steelblue;"),
  br(),
  fluidRow(
    column(
      width = 6,
      tags$h3("Shiny default", style = "color: steelblue;"),
      checkboxInput(inputId = "id1", label = "A single checkbox", value = TRUE),
      verbatimTextOutput(outputId = "res1"),
      br(),
      checkboxGroupInput(inputId = "id3", label = "Checkboxes", choices = c("A", "B", "C"), selected = "A"),
      verbatimTextOutput(outputId = "res3"),
      br(),
      radioButtons(inputId = "id5", label = "Radio buttons", choices = c("A", "B", "C")),
      verbatimTextOutput(outputId = "res5"),
      br()
    ),
    column(
      width = 6,
      tags$h3("With Font Awesome Bootstrap via Flatlogic", style = "color: steelblue;"),
      awesomeCheckbox(inputId = "id2", label = "A single checkbox", value = TRUE),
      verbatimTextOutput(outputId = "res2"),
      br(),
      awesomeCheckboxGroup(inputId = "id4", label = "Checkboxes", choices = c("A", "B", "C"), selected = "A"),
      verbatimTextOutput(outputId = "res4"),
      br(),
      awesomeRadio(inputId = "id6", label = "Radio buttons", choices = c("A", "B", "C"), selected = "A", inline = TRUE),
      verbatimTextOutput(outputId = "res6"),
      br()
    )
  )
)

server <- function(input, output, session) {
  lapply(
    X = seq_len(20),
    FUN = function(i) {
      output[[paste0("res", i)]] <- renderPrint({
        input[[paste0("id", i)]]
      })
    }
  )
}

shinyApp(ui = ui, server = server)
