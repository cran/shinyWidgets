
library("shiny")
library("shinyWidgets")


ui <- fluidPage(
  br(),

  fluidRow(

    column(
      width = 6,
      sliderTextInput(
        inputId = "slider1",
        label = "One choice among letters:",
        choices = letters, selected = "g"
      ),
      verbatimTextOutput(outputId = "res1"),

      br(),

      sliderTextInput(
        inputId = "slider2",
        label = "Range slider:",
        choices = month.name,
        selected = month.name[c(4, 7)]
      ),
      verbatimTextOutput(outputId = "res2"),

      br(),

      sliderTextInput(
        inputId = "slider3",
        label = "With grid and animation:",
        choices = LETTERS,
        selected = "A",
        grid = TRUE,
        animate = TRUE,
        width = "400px"
      ),
      verbatimTextOutput(outputId = "res3"),

      br(),

      sliderTextInput(
        inputId = "slider3b",
        label = "With from_min='E' and from_max='T' :",
        choices = LETTERS,
        selected = "A",
        from_min = "E", from_max = "T",
        width = "400px"
      ),
      verbatimTextOutput(outputId = "res3b"),

      br(),

      sliderTextInput(
        inputId = "slider3c",
        label = "Left handle restricted to A:E, right to R:Z :",
        choices = LETTERS,
        selected = c("A", "T"),
        from_min = "A", from_max = "E",
        to_min = "R", to_max = "Z",
        width = "400px"
      ),
      verbatimTextOutput(outputId = "res3c"),

      br(),

      sliderTextInput(
        inputId = "slider3d",
        label = "Fixed right handle :",
        choices = LETTERS,
        selected = c("A", "T"),
        to_fixed = TRUE,
        width = "400px"
      ),
      verbatimTextOutput(outputId = "res3d"),

      br(),

      sliderTextInput(
        inputId = "slider4",
        label = "Arbitrary character vector:",
        choices = c("Awful", "Bof", "Neutral", "Correct", "Very good"),
        selected = "Very good",
        grid = TRUE,
        hide_min_max = TRUE
      ),
      verbatimTextOutput(outputId = "res4"),

      br(),

      sliderTextInput(
        inputId = "slider5",
        label = "Custom numeric vector:",
        choices = c(1, 10, 100, 500),
        selected = 1,
        grid = TRUE
      ),
      verbatimTextOutput(outputId = "res5")
    ),

    column(
      width = 6,
      sliderTextInput(
        inputId = "update",
        label = "Update example:",
        choices = letters[1:5], selected = "b", grid = TRUE
      ),
      verbatimTextOutput(outputId = "resupdate"),
      radioButtons(inputId = "updateSlider", label = "Choose to update:", choices = letters[1:5], selected = "b"),

      br(),

      sliderTextInput(
        inputId = "pb",
        label = "Mmh:",
        choices = c("a,b", "c,d", "e"), selected = "a,b"
      ),
      verbatimTextOutput(outputId = "respb"),

      br(), br(),

      sliderInput("obs", "Number of observations:",
                  min = 0, max = 1000, value = 500
      ),
      verbatimTextOutput(outputId = "noconflict")
    )

  )

)

server <- function(input, output, session) {

  output$res1 <- renderPrint(str(input$slider1))

  output$res2 <- renderPrint(str(input$slider2))

  output$res3 <- renderPrint(str(input$slider3))

  output$res3b <- renderPrint(str(input$slider3b))

  output$res3c <- renderPrint(str(input$slider3c))
  output$res3d <- renderPrint(str(input$slider3d))

  output$res4 <- renderPrint(str(input$slider4))

  output$res5 <- renderPrint(str(input$slider5))


  output$respb <- renderPrint(str(input$pb))


  output$resupdate <- renderPrint(str(input$update))

  observeEvent(input$updateSlider, {
    updateSliderTextInput(session = session, inputId = "update", selected = input$updateSlider)
  })


  output$noconflict <- renderPrint(str(input$obs))

}

shinyApp(ui = ui, server = server)
