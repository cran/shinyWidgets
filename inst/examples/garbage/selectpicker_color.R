

# Select Picker with colors


library("shiny")
library("shinyWidgets")
library("RColorBrewer")

cols <- c(brewer.pal(n = 9, name = "Blues"), brewer.pal(n = 9, name = "Greens"))
colstext <- c(rep("black", 5), rep("white", 4), rep("black", 5), rep("white", 4))

brewer.pal.info
# List of pals
pals <- list(
  "Dark2" = brewer.pal(n = 8, name = "Dark2"),
  "Set1" = brewer.pal(n = 9, name = "Set1"),
  "Accent" = brewer.pal(n = 8, name = "Accent"),
  "Reds" = brewer.pal(n = 9, name = "Reds"),
  "Greens" = brewer.pal(n = 9, name = "Greens"),
  "RdBu" = brewer.pal(n = 11, name = "RdBu"),
  "Spectral" = brewer.pal(n = 11, name = "Spectral")
)

pals2 <- list(
  "Qualitative" = c("Dark2", "Set1", "Accent"),
  "Sequential" = c("Reds", "Blues"),
  "Divergente" = c("RdBu", "Spectral")
)

# Calc linear gradient for CSS
linear_gradient <- function(cols) {
  x <- round(seq(from = 0, to = 100, length.out = length(cols)+1))
  ind <- c(1, rep(seq_along(x)[-c(1, length(x))], each = 2), length(x))
  m <- matrix(data = paste0(x[ind], "%"), ncol = 2, byrow = TRUE)
  res <- lapply(
    X = seq_len(nrow(m)),
    FUN = function(i) {
      paste(paste(cols[i], m[i, 1]), paste(cols[i], m[i, 2]), sep = ", ")
    }
  )
  res <- unlist(res)
  res <- paste(res, collapse = ", ")
  paste0("linear-gradient(to right, ", res, ");")
}
linear_gradient(pals$Dark2)
background_pals <- unlist(lapply(X = pals, FUN = linear_gradient))

# .container {
#   background: linear-gradient(
#     to right,
#     #ff9e2c 0%,
#     #ff9e2c 50%,
#     #b6701e 50%,
#     #b6701e 100%
#   );
#   height: 100%;
#   width: 100%;
# }



# Apps
ui <- fluidPage(
  tags$h1("Color Select"),
  fluidRow(
    column(
      width = 3,
      pickerInput(
        inputId = "id1", label = "Choose a color :",
        choices = cols,
        option = list(`show-tick` = TRUE),
        choicesOpt = list(
          content = sprintf(
            "<div style='width: 100%%; padding: 5px; border-radius: 4px; background: %s; color: %s'>%s</div>", cols, colstext, cols
          )#,
          # style = sprintf("background: %s", cols)
        )
      ),
      verbatimTextOutput("res1"),
      br(),
      pickerInput(
        inputId = "id2", label = "Choose a palette :",
        choices = pals2, #names(pals),
        option = list(`show-tick` = TRUE),
        choicesOpt = list(
          content = sprintf(
            "<div style='width: 100%%; padding: 5px; border-radius: 4px; background: %s; color: %s'>%s</div>",
            unname(background_pals), c(rep("#000000", 5), rep("#FFFFFF", 2)), names(pals)
          )
        )
      ),
      verbatimTextOutput("res2")
    )
  )
)

server <- function(input, output, session) {
  output$res1 <- renderPrint(input$id1)
  output$res2 <- renderPrint(input$id2)
}

shinyApp(ui = ui, server = server)
