library(shiny)
library(magick)
shinyServer(function(input, output, session) {
    
    observe({
        my_images <- dir("../img", pattern=".png")
        updateSelectInput(inputId = "imagePath",choices = c("",my_images))
    })
    
    my_image_path <- reactive({
        validate(need(input$imagePath!="",label = "Image "))
        normalizePath(  file.path("../img",input$imagePath))
    })
    
    output$image1 <- renderImage({
        my_path <-my_image_path()
        list(src = my_path, alt="image")
    }, deleteFile = FALSE)
    
    output$image2 <- renderImage({
        input_path <- my_image_path()
        my_image <- image_read(input_path)
        tmppath <- tempfile()
        img <- image_draw(my_image)
        rect(20, 20, 200, 100, border = "red", lty = "dashed", lwd = 5)
        abline(h = 300, col = 'blue', lwd = '10', lty = "dotted")
        text(30, 250, "Hoiven-Glaven", family = "monospace", cex = 4, srt = 90)
        palette(rainbow(11, end = 0.9))
        symbols(rep(200, 11), seq(0, 400, 40), circles = runif(11, 5, 35),
                bg = 1:11, inches = FALSE, add = TRUE)
        dev.off()
        image_write(img,tmppath,format = "png")
        list(src = tmppath)
    }, deleteFile = TRUE)
    

})
