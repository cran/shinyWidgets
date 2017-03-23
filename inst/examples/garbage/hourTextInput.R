
`%AND%` <- function (x, y)
{
  if (!is.null(x) && !is.na(x))
    if (!is.null(y) && !is.na(y))
      return(y)
  return(NULL)
}

hourTextInput <- function (inputId, label, value = "", width = NULL, placeholder = NULL)
{
  value <- restoreInput(id = inputId, default = value)
  div(class = "form-group shiny-input-container", style = if (!is.null(width))
    paste0("width: ", validateCssUnit(width), ";"), label %AND%
      tags$label(label, `for` = inputId),
    tags$input(id = inputId,
               type = "text", class = "form-control", value = value,
               placeholder = placeholder),
    tags$script(HTML(paste0("$('#", inputId, "').mask('00:00');"))))
}

library("shiny")

ui <- fluidPage(
  tags$script(src = "https://raw.githubusercontent.com/igorescobar/jQuery-Mask-Plugin/master/dist/jquery.mask.min.js"),
  hourTextInput(inputId = "test", label = "Heure", value = "10:10"),
  verbatimTextOutput(outputId = "res")
)

server <- function(input, output, session) {
  output$res <- renderPrint({
    input$test
  })
}

shinyApp(ui = ui, server = server)
