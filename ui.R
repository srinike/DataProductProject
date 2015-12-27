library(shiny)

shinyUI(pageWithSidebar( # standard shiny layout, controls on the
  # left, output on the right
  
  headerPanel(h3("Resume Cover"),
              windowTitle = "Resume Cover - Create cover page for your resume"), 
  

  sidebarPanel( 
    
    h4("Create a cover page for your resume"),
    h5("How to use:"),
    p("1. This application creates a 'wordcloud' that can be used as the cover page for your resume"),
    p("2. Select the text file (.txt) for which the cover page is needed"),
    p("3. A word cloud will be generated and displayed on the right hand side"),
    p("4. Right-click on the 'wordcloud' and save it as a image file"),
    p("5. Include the image in the cover page of the resume "),

    fileInput('fileName', 'Choose a file ',
              accept = c(
                'text/csv',
                'text/comma-separated-values',
                'text/plain',
                '.csv',
                '.txt'
              )
    )
  ),

  mainPanel(
    plotOutput("wordCloudPlot")
  )
  
))