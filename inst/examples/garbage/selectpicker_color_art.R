
library("RColorBrewer")


rgraph_gallery_137 <- function(pal) {
  set.seed(345)
  library(ggplot2)
  library(RColorBrewer)
  ngroup=30
  names=paste("G_",seq(1,ngroup),sep="")
  DAT=data.frame()
  for(i in seq(1:30)){
    data=data.frame( matrix(0, ngroup , 3))
    data[,1]=i
    data[,2]=sample(names, nrow(data))
    data[,3]=prop.table(sample( c(rep(0,100),c(1:ngroup)) ,nrow(data)))
    DAT=rbind(DAT,data)
  }
  colnames(DAT)=c("Year","Group","Value")
  DAT=DAT[order( DAT$Year, DAT$Group) , ]
  coul = brewer.pal(brewer.pal.info$maxcolors[rownames(brewer.pal.info)==pal], pal)
  # coul = colorRampPalette(coul)(ngroup)
  coul <- coul[sample.int(length(coul), ngroup, TRUE)]
  coul=coul[sample(c(1:length(coul)) , size=length(coul) ) ]
  ggplot(DAT, aes(x = Year, y = Value, fill = Group)) +
    geom_area(alpha=1)+
    theme_bw() +
    # scale_fill_brewer(palette = "Reds")+
    scale_fill_manual(values = coul)+
    theme(line = element_blank(),
          text = element_blank(),
          title = element_blank(),
          legend.position="none",
          panel.border = element_blank(),
          panel.background = element_blank())
}


# Get all colors given a palette name(s)
get_brewer_name <- function(name) {
  pals <- brewer.pal.info[rownames(brewer.pal.info) %in% name, ]
  res <- lapply(
    X = seq_len(nrow(pals)),
    FUN = function(i) {
      brewer.pal(n = pals$maxcolors[i], name = rownames(pals)[i])
    }
  )
  unlist(res)
}

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

# List of palettes
colors_pal <- lapply(
  X = split(
    x = brewer.pal.info,
    f = factor(brewer.pal.info$category, labels = c("Diverging", "Qualitative", "Sequential"))
  ),
  FUN = rownames
)
background_pals <- sapply(unlist(colors_pal, use.names = FALSE), get_brewer_name)
background_pals <- unlist(lapply(X = background_pals, FUN = linear_gradient))
colortext_pals <- rep(c("white", "black", "black"), times = sapply(colors_pal, length))




library("shiny")
library("shinyWidgets")
ui <- fluidPage(
  tags$h1("Select Picker Example for RColorBrewer Palettes", style = "font-weight: bold; color: steelblue;"),
  tags$h3(
    "Plot : ",
    tags$a(
      href = "http://www.r-graph-gallery.com/137-spring-shapes-data-art/",
      "Spring Shapes by Yan Holtz from R Graph Gallery"
    )
  ),
  fluidRow(
    column(
      width = 3,
      tags$div(style = "height: 20px;"),
      pickerInput(
        inputId = "col_palette", label = "Choose a palette :",
        choices = colors_pal, selected = "Paired",
        choicesOpt = list(
          content = sprintf(
            "<div style='width:100%%;padding:5px;border-radius:4px;background:%s;color:%s'>%s</div>",
            unname(background_pals), colortext_pals, names(background_pals)
          )
        )
      )
    ),
    column(
      width = 9,
      plotOutput(outputId = "graph", height = "600px")
    )
  )
)
server <- function(input, output){
  output$graph <- renderPlot({
    rgraph_gallery_137(input$col_palette)
  })
}
shinyApp(ui = ui, server = server)





