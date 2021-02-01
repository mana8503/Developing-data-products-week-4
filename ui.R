#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a scatter plot
shinyUI(fluidPage(

    # Application title
    titlePanel("Scatter Plot"),

    # Sidebar with a slider input for mean and sd for x and y
    sidebarLayout(
        sidebarPanel(
            sliderInput("Xmean",
                        "Mean of X:",
                        min = -5,
                        max = 5,
                        value = 0),
            sliderInput("Ymean",
                        "Mean of Y:",
                        min = -5,
                        max = 5,
                        value = 0),
            sliderInput("sdX",
                        "Standard Deviation of X:",
                        min = 1,
                        max = 10,
                        value = 5),
            sliderInput("sdY",
                        "Standard Deviation of Y:",
                        min = 1,
                        max = 10,
                        value = 5)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("dispPlot")
        )
    )
))
