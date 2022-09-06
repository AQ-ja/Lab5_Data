#Importamos las librerias
library(tm)

#LLamamos a la base de datos.
data<-read.csv('train_tunned.csv')
View(data)

summary(data)


# Frecuencia 
text<- readLines('train_tunned.csv')
TextDoc <- Corpus(VectorSource(text))
#//////////////////////////////////////////////////

TextDoc_dtm <- TermDocumentMatrix(TextDoc)
dtm_m <- as.matrix(TextDoc_dtm)

# Frecuencia
dtm_v <- sort(rowSums(dtm_m), decreasing = TRUE)
dtm_d <- data.frame(word = names(dtm_v), frequency=dtm_v)
head(dtm_d, 50)