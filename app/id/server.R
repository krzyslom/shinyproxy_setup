library(shiny)

server <- function(input, output, session) {
  id <- 'basename "$(cat /proc/1/cpuset)"'
  
  output$txt <- renderPrint({
    system(id, intern = TRUE)
  })
}
