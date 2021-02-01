---
title: Mean and Standard Deviation affects on a Scatter Plot
author: "Amanda Hughes"
date: "2/1/2021"
output: ioslides_presentation
runtime: shiny
---

## Mean

- What is mean?

Mean is the sum of a given set of numbers, divided by the how many numbers in the set.  
It is also refered to as an average.

- How does this affect the plot?

The mean of X and Y shifts where the center of the data points are on the respective axis.  

## Standard Deviation

- What is standard deviation?

Standard Deviation is the is a measure of the amount of variation or dispersion of a set of values. 

- How does this affect the plot?

The standard deviation will adjust the spread of points on the plot.  

A low standard deviation indicates that the values tend to be close to the mean of the set.
A high standard deviation indicates that the values are spread out over a wider range.

## Using the App

Now that we have an understanding on how mean and standard deviation can affect a scatter plot, the app in the next slide can help visualize these changes.  

For both x and y, select the mean and standard deviation.  These inputs will be used in a normal distribution random number generator to select 20 points to plot for X and Y.  

### Helpful hints
- To see the shift in means better, make standard deviations low.
- See what happens when you make X standard deviation high and Y low.

## Scatter Plot
```{r, echo = FALSE}
library(shiny)
library(ggplot2)

shinyApp(
  
   ui = fluidPage(

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
     mainPanel(plotOutput("dispPlot"))
    )),

  server = function(input, output) {
    output$dispPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x <- rnorm(20, input$Xmean, input$sdX)
        y <- rnorm(20, input$Ymean, input$sdY)
        
        # draw the histogram with the specified number of bins
        qplot(x, y, ylim = c(-30,30), xlim = c(-30,30), aes(size = 2))
    })
  }
)

```
