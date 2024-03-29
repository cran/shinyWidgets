% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/input-colorselector.R
\name{colorSelectorInput}
\alias{colorSelectorInput}
\alias{colorSelectorExample}
\title{Color Selector Input}
\usage{
colorSelectorInput(
  inputId,
  label,
  choices,
  selected = NULL,
  mode = c("radio", "checkbox"),
  display_label = FALSE,
  ncol = 10
)

colorSelectorExample()
}
\arguments{
\item{inputId}{The \code{input} slot that will be used to access the value.}

\item{label}{Display label for the control, or \code{NULL} for no label.}

\item{choices}{A list of colors, can be a list of named list, see example.}

\item{selected}{Default selected color, if \code{NULL} the first color for \code{mode = 'radio'}
and none for \code{mode = 'checkbox'}}

\item{mode}{\code{'radio'} for only one choice, \code{'checkbox'} for
selecting multiple values.}

\item{display_label}{Display list's names after palette of color.}

\item{ncol}{If choices is not a list but a vector, go to line after n elements.}
}
\description{
Choose between a restrictive set of colors.
}
\section{Functions}{
\itemize{
\item \code{colorSelectorExample()}: Examples of use for colorSelectorInput

}}
\examples{
if (interactive()) {

# Full example
colorSelectorExample()

# Simple example
ui <- fluidPage(
  colorSelectorInput(
    inputId = "mycolor1", label = "Pick a color :",
    choices = c("steelblue", "cornflowerblue",
                "firebrick", "palegoldenrod",
                "forestgreen")
  ),
  verbatimTextOutput("result1")
)

server <- function(input, output, session) {
  output$result1 <- renderPrint({
    input$mycolor1
  })
}

shinyApp(ui = ui, server = server)

}
}
