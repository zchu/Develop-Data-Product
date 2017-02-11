shinyUI(fluidPage(  
    titlePanel("Body Mass Index Calculator"),  
   
    fluidRow(
        textOutput("help")
    ),
    
    fluidRow(
        
       radioButtons("measure", label = h4("Choose Unit System"),
                    choices = list("Metric" = 1, "Imperial" = 2), selected = 1),
       
       conditionalPanel(
           condition = "input.measure == 1",
           uiOutput('metric')
           ),
       
       conditionalPanel(
           condition = "input.measure == 2",
           uiOutput('imperial')
       )),


    fluidRow(
        column(3,
               numericInput("Age", label = h4("Age"),
                            value = 35)),

        column(3,
               radioButtons("Gender",label = h4("Gender"),
                            choices = list("Male" = 1, "Female" = 2), selected = 1))
    ),

    
    fluidRow(
        column(3,
               actionButton("submit", "Submit"))
     ),

    fluidRow(
        column(3, align = "right", 
               textOutput("text1"),
               textOutput("main"),
               textOutput("text2"))
    )
))


