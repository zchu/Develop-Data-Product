
library(UsingR)

shinyServer(  
    function(input, output, session) {    
        
        output$help <- renderText(strwrap("Please input your height, weight, age and gender, then click 'submit' button, the result will be displayed below. 
                                  You can choose between imperial or metric system.", width = 10))
         
        output$imperial <- renderUI({
           tagList( 
            h3("Your Height:"),
            numericInput("feet", label = h5("feet"),value = 5, max = 8, min = 3),
            numericInput("inch", label = h5("inch"),value = 6, max = 12, min = 0),
            h3("Your Weight:"),
            numericInput("pounds", label = h5("pounds"),value = 150)
           )
        })
            

        output$metric <- renderUI({
            tagList(
            h3("Your Height:"),
            numericInput("cm", label = h5("cm"), value = 170),
            h3("Your Weight:"),
            numericInput("kg", label = h5("kg"), value = 70)
            )
            
        })
        

        BMI <- reactive({
            
            if(input$measure == 1){
                return(input$kg/(input$cm/100)^2)
            }
            if(input$measure == 2){
                return(703 * input$pounds/(12* input$feet + input$inch)^2)
            }
        })
        
        WeightStatus <- reactive(
            {
                if(BMI() < 18.5){
                    return(paste("You are under weight!"))
                }
                else if (BMI() <= 24.9){
                    return(paste("You have normal weight!"))
                }
                
                else if (BMI() <= 29.9){
                    return(paste("You are over weight!"))
                }
                
                else if (BMI() > 29.9){
                    return(paste("You have Obesity!"))
                }
            }
        )
        
        observeEvent(input$submit, 
                    {
                        output$text1 <- renderText("Your Body Mass Index is: ")
                        if (input$measure == 1){
                            output$main <- renderText(BMI())
                        }
                        if (input$measure == 2){
                            output$main <- renderText(BMI())
                        }
                        
                        output$text2 <- renderText( WeightStatus())
                        
                    }
                    )
       
    }) 