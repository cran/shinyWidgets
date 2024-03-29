
#' @title Select Picker Input Control
#'
#' @description An alternative to [shiny::selectInput()] with plenty of options to customize it.
#'
#' @param inputId The `input` slot that will be used to access the value.
#' @param label Display label for the control, or `NULL` for no label.
#' @param choices List of values to select from. If elements of the
#'  list are named then that name rather than the value is displayed to the user.
#' @param selected The initially selected value (or multiple values if `multiple = TRUE`).
#' If not specified then defaults to the first value for single-select lists
#'  and no values for multiple select lists.
#' @param multiple Is selection of multiple items allowed?
#' @param options List of options, see \link{pickerOptions} for all available options.
#' To limit the number of selection possible, see example below.
#' @param choicesOpt A `list()` of options for individual choices in the dropdown menu,
#'  each element of the `list` should the same length as `choices`. You can use the following options :
#'    * `disabled`: logical vector indicating if the choice can be selected or not.
#'    * `style`: CSS styles applied to the choice tag
#'    * `class`: CSS class added to the choice tag
#'    * `icon`: vector of icon names to display before choices (to use `icon("arrow-right")`, you have to use `fa-arrow-right` and `pickerOptions(iconBase = "fas")`)
#'    * `subtext` add a text after the choice
#'    * `content`: replace entire choice with custom content (like raw HTML)
#'    * `tokens`: add tokens associated with choices used in search results.
#' @param width The width of the input : 'auto', 'fit', '100px', '75%'.
#' @param inline Display picker inline, to have label and menu on same line use `width = "fit"`.
#' @param stateInput Activate or deactivate the special input value `input$<inputId>_open` to know if the menu is opened or not, see details.
#' @param autocomplete Sets the initial state of the autocomplete property.
#'
#' @seealso [updatePickerInput] to update value server-side. [virtualSelectInput()] for an alternative.
#'
#' @return A select control that can be added to a UI definition.
#'
#' @importFrom shiny restoreInput
#' @importFrom htmltools tags htmlEscape validateCssUnit
#'  tagAppendAttributes tagAppendChildren tag
#'
#' @export
#'
#' @note State of the picker (open or close) is accessible server-side through the input value:
#'  \code{input$<inputId>_open}, which can be \code{TRUE} (opened) or \code{FALSE} (closed).
#'
#' @references SnapAppointments and contributors. "The jQuery plugin that brings
#'  select elements into the 21st century with intuitive multiselection,
#'  searching, and much more. Now with Bootstrap 4 support".
#'  \url{https://github.com/snapappointments/bootstrap-select/}
#'
#' @examples
#' ## Only run examples in interactive R sessions
#' if (interactive()) {
#'
#' # You can run the gallery to see other examples
#' shinyWidgetsGallery()
#'
#'
#' # Basic usage
#' library("shiny")
#' library(shinyWidgets)
#'
#' ui <- fluidPage(
#'   pickerInput(
#'     inputId = "somevalue",
#'     label = "A label",
#'     choices = c("a", "b")
#'   ),
#'   verbatimTextOutput("value")
#' )
#'
#' server <- function(input, output) {
#'   output$value <- renderPrint(input$somevalue)
#' }
#'
#' shinyApp(ui, server)
#'
#' }
#'
#' @example examples/picker-select-all.R
#' @example examples/picker-value-display.R
#' @example examples/picker-limits.R
pickerInput <- function(inputId,
                        label = NULL,
                        choices,
                        selected = NULL,
                        multiple = FALSE,
                        options = list(),
                        choicesOpt = NULL,
                        width = NULL,
                        inline = FALSE,
                        stateInput = TRUE,
                        autocomplete = FALSE) {
  choices <- choicesWithNames(choices)
  selected <- restoreInput(id = inputId, default = selected)
  if (!is.null(options) && length(options) > 0)
    names(options) <- paste("data", names(options), sep = "-")
  if (!is.null(width))
    options <- c(options, list("data-width" = width))
  if (!is.null(width) && width %in% c("fit"))
    width <- NULL
  options <- lapply(options, function(x) {
    if (identical(x, TRUE))
      "true"
    else if (identical(x, FALSE))
      "false"
    else x
  })
  maxOptGroup <- options[["data-max-options-group"]]

  options[["data-state-input"]] <- ifelse(isTRUE(stateInput), "true", "false")

  selectTag <- tag("select", dropNulls(options))
  selectTag <- tagAppendAttributes(
    tag = selectTag,
    id = inputId,
    class = "selectpicker form-control",
    autocomplete = if (autocomplete) "on" else "off"
  )
  selectTag <- tagAppendChildren(
    tag = selectTag,
    pickerSelectOptions(choices, selected, choicesOpt, maxOptGroup)
  )

  if (multiple)
    selectTag$attribs$multiple <- "multiple"

  pickerTag <- tags$div(
    class = "form-group shiny-input-container",
    class = if (isTRUE(inline)) "shiny-input-container-inline",
    style = css(width = validateCssUnit(width)),
    style = if (isTRUE(inline)) "display: inline-block;",
    tagAppendAttributes(
      label_input(inputId, label),
      style = if (isTRUE(inline)) "display: inline-block;",
    ),
    selectTag
  )
  attachShinyWidgetsDep(pickerTag, "picker")
}



#' @title Change the value of a select picker input on the client
#'
#' @description
#' Change the value of a picker input on the client
#'
#' @param session The session object passed to function given to shinyServer.
#' @param inputId	The id of the input object.
#' @param label Display a text in the center of the switch.
#' @param choices List of values to select from. If elements of the list are named
#' then that name rather than the value is displayed to the user.
#' @param selected The new selected value (or multiple values if `multiple = TRUE`).
#'  To reset selected value, in case of multiple picker, use `character(0)`.
#' @param choicesOpt Options for choices in the dropdown menu.
#' @param options Options for the picker via [pickerOptions()].
#' @param clearOptions Clear previous options, otherwise the ones set previously are still active.
#'
#' @seealso [pickerInput()].
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'
#' library("shiny")
#' library("shinyWidgets")
#'
#' ui <- fluidPage(
#'   tags$h2("Update pickerInput"),
#'
#'   fluidRow(
#'     column(
#'       width = 5, offset = 1,
#'       pickerInput(
#'         inputId = "p1",
#'         label = "classic update",
#'         choices = rownames(mtcars)
#'       )
#'     ),
#'     column(
#'       width = 5,
#'       pickerInput(
#'         inputId = "p2",
#'         label = "disabled update",
#'         choices = rownames(mtcars)
#'       )
#'     )
#'   ),
#'
#'   fluidRow(
#'     column(
#'       width = 10, offset = 1,
#'       sliderInput(
#'         inputId = "up",
#'         label = "Select between models with mpg greater than :",
#'         width = "50%",
#'         min = min(mtcars$mpg),
#'         max = max(mtcars$mpg),
#'         value = min(mtcars$mpg),
#'         step = 0.1
#'       )
#'     )
#'   )
#'
#' )
#'
#' server <- function(input, output, session) {
#'
#'   observeEvent(input$up, {
#'     mtcars2 <- mtcars[mtcars$mpg >= input$up, ]
#'
#'     # Method 1
#'     updatePickerInput(session = session, inputId = "p1",
#'                       choices = rownames(mtcars2))
#'
#'     # Method 2
#'     disabled_choices <- !rownames(mtcars) %in% rownames(mtcars2)
#'     updatePickerInput(
#'       session = session, inputId = "p2",
#'       choices = rownames(mtcars),
#'       choicesOpt = list(
#'         disabled = disabled_choices,
#'         style = ifelse(disabled_choices,
#'                        yes = "color: rgba(119, 119, 119, 0.5);",
#'                        no = "")
#'       )
#'     )
#'   }, ignoreInit = TRUE)
#'
#' }
#'
#' shinyApp(ui = ui, server = server)
#'
#' }
updatePickerInput <- function (session = getDefaultReactiveDomain(),
                               inputId,
                               label = NULL,
                               selected = NULL,
                               choices = NULL,
                               choicesOpt = NULL,
                               options = NULL,
                               clearOptions = FALSE) {
  choices <- if (!is.null(choices))
    choicesWithNames(choices)
  if (!is.null(selected))
    selected <- validateSelected(selected, choices, inputId)
  maxOptGroup <- options[["max-options-group"]]
  choices <- if (!is.null(choices))
    as.character(pickerSelectOptions(choices, selected, choicesOpt, maxOptGroup = maxOptGroup))
  message <- dropNulls(list(
    label = label,
    choices = choices,
    value = selected,
    options = options,
    clearOptions = isTRUE(clearOptions)
  ))
  session$sendInputMessage(inputId, message)
}





#' Generate pickerInput options
#'
#' @param choices a named list
#' @param selected selected value if any
#' @param choicesOpt additional option ofr choices
#'
#' @importFrom htmltools HTML htmlEscape tagList tags
#'
#' @noRd
pickerSelectOptions <- function(choices, selected = NULL, choicesOpt = NULL, maxOptGroup = NULL) {
  if (is.null(choicesOpt) & is.null(maxOptGroup)) {
    return(selectOptions(choices, selected))
  }
  if (is.null(choicesOpt))
    choicesOpt <- list()
  l <- sapply(choices, length)
  if (!is.null(maxOptGroup))
    maxOptGroup <- rep_len(x = maxOptGroup, length.out = sum(l))
  m <- matrix(data = c(c(1, cumsum(l)[-length(l)] + 1), cumsum(l)), ncol = 2)
  html <- lapply(
    X = seq_along(choices),
    FUN = function(i) {
      label <- names(choices)[i]
      choice <- choices[[i]]
      if (is.list(choice)) {
        tags$optgroup(
          label = htmlEscape(label, TRUE),
          `data-max-options` = if (!is.null(maxOptGroup)) maxOptGroup[i],
          pickerSelectOptions(
            choice, selected,
            choicesOpt = lapply(
              X = choicesOpt,
              FUN = function(j) {
                j[m[i, 1]:m[i, 2]]
              }
            )
          )
        )
      } else {
        ii <- m[i, 1]
        tags$option(
          value = choice,
          HTML(htmlEscape(label)),
          style = choicesOpt$style[ii],
          class = choicesOpt$class[ii],
          `data-icon` = choicesOpt$icon[ii],
          `data-subtext` = choicesOpt$subtext[ii],
          `data-content` = choicesOpt$content[ii],
          `data-tokens` = choicesOpt$tokens[ii],
          disabled = if (!is.null(choicesOpt$disabled[ii]) && choicesOpt$disabled[ii]) "disabled",
          selected = if (choice %in% selected) "selected" else NULL
        )
      }
    }
  )
  return(tagList(html))
}

# From shiny/input-select.R, faster alternative if no choice options specific to picker
selectOptions <- function(choices, selected = NULL) {
  html <- mapply(choices, names(choices), FUN = function(choice, label) {
    if (is.list(choice)) {
      sprintf(
        '<optgroup label="%s">\n%s\n</optgroup>',
        htmlEscape(label, TRUE),
        selectOptions(choice, selected)
      )

    } else {
      sprintf(
        '<option value="%s"%s>%s</option>',
        htmlEscape(choice, TRUE),
        if (choice %in% selected) ' selected' else '',
        htmlEscape(label)
      )
    }
  })
  HTML(paste(html, collapse = '\n'))
}


