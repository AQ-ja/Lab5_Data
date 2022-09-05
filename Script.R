#Importamos la data cruda
data<-read.csv("train.csv")
View(data)

#Seteamos las variables a emilinar 
data$text<-gsub("#[A-Za-z0-9]+|@[A-Za-z0-9]+|\\w+(?:\\.\\w+)*/\\S+", "", data$text)
data$text<-toupper(data$text)
data$text<-gsub("HTTP://","",data$text)
data$text<-gsub("HTTPS://","",data$text)
data$text<-gsub("[^\x01-\x7F]", "",data$text)
data$text<-gsub("B&amp;N", "",data$text)
data$text<-gsub("#", "",data$text)
data$text<-gsub('(s+)(A|AN|AND|THE|I)(s+)', '', data$text)
data$text<-gsub(':', '', data$text)
data$text<-gsub("'", '', data$text)
data$text<-gsub("--|", '', data$text)
data$text<-gsub('[[:punct:]]', '', data$text)
data$text<-gsub('http",1', '', data$text)
data$text<-gsub('http', '', data$text)
data$text<-gsub('http",0', '', data$text)
data$text<-gsub(' ",0 ', '', data$text)
data$text<-gsub(' ",1 ', '', data$text)


#Ahora los datos quedan limpios y tambien se convierten todos a mayusculas. 
View(data)

#Para mayor facilidad y versatilidad, se hara un nuevo csv con los datos recien hechos. 
write.csv(data, "train_tunned.csv", row.names = FALSE)