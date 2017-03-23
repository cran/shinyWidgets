

library("shiny")
library("shinyWidgets")


basicPanel <- function(..., width = 4) {
  column(
    width = width,
    tags$div(
      class="panel panel-default", style="border: 1px solid; border-color: steelblue;",
      tags$div(
        class="panel-body",
        ...
      )
    )
  )
}


ui <- fluidPage(
  tags$h1("Update selectPicker examples", style = "font-weight: bold; color: steelblue;"),
  br(),
  fluidRow(
    basicPanel(
      pickerInput(inputId = "id1", label = "Update selected", choices = c("a", "b", "c", "d")),
      radioButtons(inputId = "update", label = "Update", choices = c("a", "b", "c", "d"), inline = TRUE),
      verbatimTextOutput("res1")
    ),

    basicPanel(
      pickerInput(inputId = "id2", label = "Update choices", choices = c("a", "b", "c", "d")),
      radioButtons(inputId = "update2", label = "Update", choices = c("lower", "upper"), inline = TRUE),
      verbatimTextOutput("res2")
    ),

    basicPanel(
      tags$div(style = "display: none;", icon("cog")),
      pickerInput(
        inputId = "id3", label = "Glyphicon <> FontAwesome",
        choices = c("glyphicon-arrow-right", "glyphicon-cog", "glyphicon-play",
                    "glyphicon-ok-sign", "glyphicon-euro", "glyphicon-music"),
        choicesOpt = list(
          icon = c("glyphicon glyphicon-arrow-right", "glyphicon glyphicon-cog", "glyphicon glyphicon-play",
                   "glyphicon glyphicon-ok-sign", "glyphicon glyphicon-euro", "glyphicon glyphicon-music")
        ),
        options = list(`icon-base` = "")
      ),
      radioButtons(inputId = "update3", label = "Update with Icons", choices = c("Glyphicon", "FontAwesome"), inline = TRUE),
      verbatimTextOutput("res3")
    )
  )
)

server <- function(input, output, session) {
  lapply(
    X = seq_len(5),
    FUN = function(i) {
      output[[paste0("res", i)]] <- renderPrint({
        input[[paste0("id", i)]]
      })
    }
  )

  observeEvent(input$update, {
    updatePickerInput(session = session, inputId = "id1", selected = input$update)
  })

  observeEvent(input$update2, {
    if (input$update2 == "lower") {
      updatePickerInput(session = session, inputId = "id2", choices = c("a", "b", "c", "d"))
    } else {
      updatePickerInput(session = session, inputId = "id2", choices = toupper(c("a", "b", "c", "d")))
    }
  })

  observeEvent(input$update3, {
    if (input$update3 == "Glyphicon") {
      updatePickerInput(
        session = session, inputId = "id3",
        choices = c("glyphicon-arrow-right", "glyphicon-cog", "glyphicon-play",
                    "glyphicon-ok-sign", "glyphicon-euro", "glyphicon-music"),
        choicesOpt = list(
          icon = c("glyphicon glyphicon-arrow-right", "glyphicon glyphicon-cog", "glyphicon glyphicon-play",
                   "glyphicon glyphicon-ok-sign", "glyphicon glyphicon-euro", "glyphicon glyphicon-music")
        )
      )
    } else {
      updatePickerInput(
        session = session, inputId = "id3",
        choices = c("fa-arrow-right", "fa-cog", "fa-play",
                    "fa-check", "fa-eur", "fa-music"),
        choicesOpt = list(
          icon = c("fa fa-arrow-right", "fa fa-cog", "fa fa-play",
                   "fa fa-check", "fa fa-eur", "fa fa-music")
        )
      )
    }
  })
}

shinyApp(ui = ui, server = server)
