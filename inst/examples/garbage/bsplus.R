ibrary("shiny")
library("shinyWidgets")
library("bsplus")

ui <- fluidPage(
  tags$h2("bsplus tooltip & popover"),
  use_bs_tooltip(),
  use_bs_popover(),
  br(),
  bs_embed_tooltip(
    materialSwitch(inputId = "msh1", label = "Switch 1", status = "primary", width = "150px"),
    title = "I'm a tooltip"
  ),
  br(),
  materialSwitch(inputId = "msh2", label = "Switch 1", status = "primary", right = TRUE) %>%
    shinyInput_label_embed(
      shiny_iconlink() %>%
        bs_embed_popover(title = "pickerInput", content = "An alternative to selectizeInput")
    )
)

server <- function(input, output, session) {

}

shinyApp(ui = ui, server = server)
