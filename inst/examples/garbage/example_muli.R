

library("shiny")
library("shinyWidgets")

# Countries
countries <- list(
  "United Kingdom", "Germany", "United States of America", "Belgium", "China", "Spain", "Netherlands", "Mexico",
  "Italy", "Canada", "Brazil", "Denmark", "Norway", "Switzerland", "Luxembourg", "Israel", "Russian Federation",
  "Turkey", "Saudi Arabia", "United Arab Emirates"
)
flags <- c("gb", "de", "us", "be", "cn", "es", "nl", "mx", "it", "ca", "br", "dk", "no", "ch", "lu", "il", "ru", "tr", "sa", "ae")
# flags <- paste0("flag-icon flag-icon-", flags)
flags <- sprintf("https://cdn.rawgit.com/lipis/flag-icon-css/master/flags/4x3/%s.svg", flags)

# Fruits
fruits <- c("Banana", "Blueberry", "Cherry", "Coconut", "Grapefruit", "Kiwi", "Lemon", "Lime", "Mango", "Orange", "Papaya")


# ui
ui <- fluidPage(
  tags$h1("multi.js"),
  br(),

  fluidRow(

    column(
      width = 6,
      tags$h3("Exemple 1"),
      multiInput(inputId = "test01", label = "Fruits :", choices = fruits, selected = "Banana", width = "350px"),
      verbatimTextOutput(outputId = "res01"),

      tags$h3("Exemple 3"),
      tags$link(rel="stylesheet", href="https://raw.githubusercontent.com/lipis/flag-icon-css/master/css/flag-icon.min.css"),
      multiInput(
        inputId = "test03",
        label = "Countries :", choices = NULL,
        choiceNames = lapply(seq_along(countries), function(i) tagList(tags$img(src = flags[i], width=20, height=15), countries[i])),
        choiceValues = countries,
        width = "400px"
      ),
      verbatimTextOutput(outputId = "res03")
    ),

    column(
      width = 6,
      tags$h3("Exemple 2"),
      multiInput(inputId = "test02", label = "Fruits :", choices = fruits, selected = "Banana", options = list(enable_search = FALSE), width = "350px"),
      verbatimTextOutput(outputId = "res02")
    )

  )
)

server <- function(input, output, session) {

  output$res01 <- renderPrint({
    input$test01
  })

  output$res02 <- renderPrint({
    input$test02
  })

  output$res03 <- renderPrint({
    input$test03
  })

}

shinyApp(ui = ui, server = server)

