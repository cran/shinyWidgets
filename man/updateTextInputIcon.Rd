% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/input-icon.R
\name{updateTextInputIcon}
\alias{updateTextInputIcon}
\title{Change the value of a text input icon on the client}
\usage{
updateTextInputIcon(
  session = getDefaultReactiveDomain(),
  inputId,
  label = NULL,
  value = NULL,
  placeholder = NULL,
  icon = NULL
)
}
\arguments{
\item{session}{The \code{session} object passed to function given to
\code{shinyServer}. Default is \code{getDefaultReactiveDomain()}.}

\item{inputId}{The id of the input object.}

\item{label}{The label to set for the input object.}

\item{value}{Initial value.}

\item{placeholder}{A character string giving the user a hint as to what can
be entered into the control. Internet Explorer 8 and 9 do not support this
option.}

\item{icon}{Icon to update, note that you can update icon only
if initialized in \code{\link[=textInputIcon]{textInputIcon()}}.}
}
\value{
No value.
}
\description{
Change the value of a text input icon on the client
}
\examples{
library(shiny)
library(shinyWidgets)

ui <- fluidPage(
  textInputIcon(
    inputId = "id",
    label = "With an icon",
    icon = icon("circle-user")
  ),
  actionButton("updateValue", "Update value"),
  actionButton("updateIcon", "Update icon"),
  verbatimTextOutput("value")
)

server <- function(input, output, session) {

  output$value <- renderPrint(input$id)

  observeEvent(input$updateValue, {
    updateTextInputIcon(
      session = session,
      inputId = "id",
      value = paste(sample(letters, 8), collapse = "")
    )
  })

  observeEvent(input$updateIcon, {
    i <- sample(c("home", "gears", "dollar-sign", "globe", "sliders-h"), 1)
    updateTextInputIcon(
      session = session,
      inputId = "id",
      icon = icon(i)
    )
  })

}

if (interactive())
  shinyApp(ui, server)
}
\seealso{
\code{\link[=textInputIcon]{textInputIcon()}}
}
