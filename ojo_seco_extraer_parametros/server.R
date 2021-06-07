
library(shiny)
library(magick)
my_image <- tiff::readTIFF(here::here("img","ojo 1.tif"))

shinyServer(function(input, output) {
    output$image2 <- renderImage(
        my_image)
    
    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })

})
