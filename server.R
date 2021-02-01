#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$dispPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x <- rnorm(20, input$Xmean, input$sdX)
        y <- rnorm(20, input$Ymean, input$sdY)
        
        # draw the histogram with the specified number of bins
        qplot(x, y, ylim = c(-30,30), xlim = c(-30,30), aes(size = 2))

    })

})
