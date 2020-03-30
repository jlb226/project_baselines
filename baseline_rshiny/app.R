
##  app.R



## UI ---------------------------------------------------------------------------------------------
ui <- fluidPage(  ## ui start


    ## Title --------------------------------------------------------------------------------------
    titlePanel("Title Panel"),


    ## Sidebar ------------------------------------------------------------------------------------
    sidebarLayout(  ## sidebarLayout start

        sidebarPanel(  ## sidebarPanel start

            sliderInput(  ## sliderInput start
                label = "Slider Input:",
                min = 0,
                max = 50,
                value = 30,
                step = 5,
                inputId = "sliderInput"
            )  ## sliderInput end

        ),  ## sidebarPanel end


        ## Main -----------------------------------------------------------------------------------
        mainPanel(  ## mainPanel start

            plotOutput(  ## plotOutput start
                click = NULL,
                height = "700px",
                width = "50%",
                outputId = "histPlot"
            )  ## plotOutput end

        )  ## mainPanel end

    )  ## sidebarLayout end

)  ## ui end



## Server -----------------------------------------------------------------------------------------
server <- function(input, output){  ## server start


    ## Histogram ----------------------------------------------------------------------------------
    output$histPlot <-
        renderPlot({  ## renderPlot start
            hist(rnorm(input$sliderInput))
        })  ## renderPlot end


}  ## server end



## Create Shiny object ----------------------------------------------------------------------------
shinyApp(ui = ui, server = server)

