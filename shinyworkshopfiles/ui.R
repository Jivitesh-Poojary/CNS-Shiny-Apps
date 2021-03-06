#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("My Title"),
  h3("My subtitle"),
  p("This is my first app!"),
  br(),
  hr(),  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30),
       fileInput('file1', 'Choose CSV File',multiple=FALSE,
                 accept=c('text/csv', 
                          'text/comma-separated-values,text/plain', 
                          '.csv')
       )
    ),

    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("distPlot")), 
        tabPanel("Summary", verbatimTextOutput("summary")), 
        tabPanel("Table", dataTableOutput("table"))
        )
    )
  )
))
