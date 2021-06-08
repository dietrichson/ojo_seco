library(shiny)
shinyUI(fluidPage(

    titlePanel("Extracción de Parametros"),
    sidebarLayout(
        sidebarPanel(
            selectInput("imagePath","Imagen", choices = c("")
                        ),
            hr()
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Imagen 1"),
            imageOutput("image1",width = "600px",height = "600px"),
            hr(),
            h3("Imagen 2"),
            imageOutput("image2",width = "600px",height = "600px")
        )
    )
))
