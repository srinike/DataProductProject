######################################
##### minimal example - server.R #####
######################################

library(shiny) 
library(tm)
library(wordcloud)
library(SnowballC)
require(RColorBrewer)


shinyServer(function(input, output) {
  
  output$wordCloudPlot = renderPlot({

    inputFileName = input$fileName
    
    if (is.null(inputFileName)){
      return(NULL)
    }
    
    documentText = read.table(inputFileName$datapath, fill=TRUE, strip.white=TRUE) 
    #  documentText = read.table("resume.txt", sep="\t", fill=FALSE, strip.white=TRUE)
    documentTextCorpus = Corpus(VectorSource(documentText))
    mainDocumentCorpus <- tm_map(documentTextCorpus, content_transformer(tolower))
    mainDocumentCorpus <- tm_map(mainDocumentCorpus, PlainTextDocument)
#    mainDocumentCorpus <- tm_map(documentTextCorpus, content_transformer(tolower))
    mainDocumentCorpus <- tm_map(mainDocumentCorpus, removePunctuation)
    mainDocumentCorpus <- tm_map(mainDocumentCorpus, stemDocument)
    mainDocumentCorpus <- tm_map(mainDocumentCorpus, removeWords, stopwords('english'))
    
    wordcloud(mainDocumentCorpus,min.freq = 1, random.order = TRUE, colors=brewer.pal(8, "Dark2"))
  })
})
  