


# Sweet Alert Example -----------------------------------------------------

library("shiny")
library("shinyWidgets")

ui <- fluidPage(
  tags$h1("Example of sweet alert messages", style = "color: steelblue;"),
  # useSweetAlert(),
  fluidRow(
    column(
      width = 5, offset = 1,
      actionButton(inputId = "success", label = "Launch a success sweet alert", width = "100%"),
      receiveSweetAlert(messageId = "successmessage"),
      br(), br(),
      actionButton(inputId = "tags", label = "Launch a sweet alert with HTML tags", width = "100%"),
      receiveSweetAlert(messageId = "tagsmessage"),
      br(), br(),
      actionButton(inputId = "info", label = "Launch an info sweet alert", width = "100%"),
      receiveSweetAlert(messageId = "infomessage")
    ),
    column(
      width = 5,
      actionButton(inputId = "error", label = "Launch an error sweet alert", width = "100%"),
      receiveSweetAlert(messageId = "errormessage"),
      br(), br(),
      actionButton(inputId = "warning", label = "Launch a warning sweet alert", width = "100%"),
      receiveSweetAlert(messageId = "warningmessage")
    )
  )
)

server <- function(input, output, session) {

  observeEvent(input$success, {
    sendSweetAlert(
      messageId = "successmessage", title = "Success !!", text = "All in order", type = "success"
    )
  })

  observeEvent(input$error, {
    sendSweetAlert(
      messageId = "errormessage", title = "Error...", text = "Oups !", type = "error"
    )
  })

  observeEvent(input$info, {
    sendSweetAlert(
      messageId = "infomessage", title = "Information", text = "Something helpful", type = "info"
    )
  })

  observeEvent(input$tags, {
    sendSweetAlert(
      messageId = "tagsmessage", title = "HTLM tags",
      text = "normal <b>bold</b> <span style='color: steelblue;'>color</span> <h1>h1</h1>", html = TRUE, type = NULL
    )
  })

  observeEvent(input$warning, {
    sendSweetAlert(
      messageId = "warningmessage", title = "Warning !!!",
      text = NULL, type = "warning"
    )
  })

}

shinyApp(ui = ui, server = server)
