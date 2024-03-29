% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/input-pretty.R
\name{updatePrettyCheckbox}
\alias{updatePrettyCheckbox}
\title{Change the value of a pretty checkbox on the client}
\usage{
updatePrettyCheckbox(
  session = getDefaultReactiveDomain(),
  inputId,
  label = NULL,
  value = NULL
)
}
\arguments{
\item{session}{The session object passed to function given to shinyServer.}

\item{inputId}{The id of the input object.}

\item{label}{The label to set for the input object.}

\item{value}{The value to set for the input object.}
}
\description{
Change the value of a pretty checkbox on the client
}
\examples{
library(shiny)
library(shinyWidgets)

ui <- fluidPage(
  tags$h1("Pretty checkbox update value"),
  br(),

  prettyCheckbox(
    inputId = "checkbox1",
    label = "Update me!",
    shape = "curve",
    thick = TRUE,
    outline = TRUE
  ),
  verbatimTextOutput(outputId = "res1"),
  radioButtons(
    inputId = "update",
    label = "Value to set:",
    choices = c("FALSE", "TRUE")
  )

)

server <- function(input, output, session) {

  output$res1 <- renderPrint(input$checkbox1)

  observeEvent(input$update, {
    updatePrettyCheckbox(
      session = session,
      inputId = "checkbox1",
      value = as.logical(input$update)
    )
  })

}

if (interactive())
  shinyApp(ui, server)
}
