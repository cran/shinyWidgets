

library("shiny")
library("shinyWidgets")
ui <- fluidPage(
 tags$h1("Material Design Switch Input"),
 br(),
 fluidRow(
   column(
     width = 4, offset = 4,
     materialSwitch(inputId = "ms0", label = NULL),
     br(),

     materialSwitch(inputId = "ms1", label = "Default switch", value = FALSE),
     verbatimTextOutput(outputId = "res1"),

     br(),

     materialSwitch(inputId = "ms2", label = "Default switch", value = FALSE, right = TRUE, width = "100%"),
     verbatimTextOutput(outputId = "res2"),

     br(),

     materialSwitch(inputId = "ms3", label = "Primary switch", status = "primary", right = TRUE),
     verbatimTextOutput(outputId = "res3"),

     br(),

     materialSwitch(inputId = "ms4", label = "Success switch", status = "success", right = TRUE),
     verbatimTextOutput(outputId = "res4"),

     br(),

     materialSwitch(inputId = "ms5", label = "Danger switch", status = "danger", right = TRUE),
     verbatimTextOutput(outputId = "res5")
   )
 )
)
server <- function(input, output){
  lapply(
    X = seq_len(12),
    FUN = function(x) {
      output[[paste0("res", x)]] <- renderPrint({
        input[[paste0("ms", x)]]
      })
    }
  )
}
shinyApp(ui = ui, server = server)
