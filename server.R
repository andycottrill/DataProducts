# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.

library(shiny)

#rainfall <- read.table("rainfall1.csv", header = TRUE,sep = ",", row.names = 1)
#SOI <- read.table("SOIa.csv", header = TRUE,sep = ",", row.names = 1)
rainSOI <- read.table("rainSOI.csv", header = TRUE, sep = ",", row.names = 1)


# Define server logic required to draw a histogram
  shinyServer(function(input, output) {
     model1 <- lm(Rainfall ~ SOI, data = rainSOI)    # Build model
     
     model1pred <- reactive({
       SOIInput <- input$sliderSOI
       predict(model1, newdata = data.frame(SOI = SOIInput))
     })
    
     output$plot1 <- renderPlot({
     SOIInput <- input$sliderSOI
     
     plot(rainSOI$SOI, rainSOI$Rainfall, xlab = "Monthly SOI Values", ylab = "Monthly Rainfall (mm)", bty = "n",
          pch =16, xlim =c(-50, 50), ylim = c(0,250))
     if(input$showModel1){
       abline(model1, col="red", lwd=2)
     }
      legend(25,250,c("Model 1 Prediction"), pch=16, col=c("red"), bty ="n", cex =1.2)
      points(SOIInput, model1pred(), col="red", pch=16, cex=2)
    })
     
     output$pred1 <- renderText({
       model1pred()
     })
  })
  
  
  
  
  