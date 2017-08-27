# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.

library(shiny)

# Define UI for application that draws 
shinyUI(fluidPage(
  titlePanel("Predicting Rainfall using the Southern Oscillation Index for Victoria, Australia."),
        # Sidebar with a slider input  
      sidebarLayout(
        sidebarPanel(
          sliderInput("sliderSOI", "What is the Predicted Monthly SOI?", min = -40,max = 40,value = 0),
          checkboxInput("showModel1","Show/Hide Model", value = TRUE),
          submitButton("Submit")
        ),
    mainPanel(
      h3("Predicted Rainfall from Linear Model: (mm)"),
      h3(textOutput("pred1")),
      plotOutput("plot1"),
      
      h4("Notes: The scatterplot graph above shows the monthly rainfall from Caulfield in Melbourne (Australia) 
        from  1887 to 2016. Its shows the relationship between rainfall and the Southern Oscillation Index (SOI)
        and is typical for many locations in Australia. The algorithm builds a linear model 
        and the slide bar allows the user to calculate the predicted annual rainfall in millimetres (shown above 
         the plot). Click on the 'Submit' button after changing the SOI values in the slider bar.") 
      
    )
  )
))