# depedencias
if (!require("tm")       ) { install.packages("tm"       ) }
if (!require("SnowballC")) { install.packages("SnowballC") }
library(tm)
library(SnowballC)


# cargar el dataset
emails = read.csv("p0405_ds_energy_bids.csv", stringsAsFactors=FALSE)

# exploramos el dataset, que contiene un conjunto de emails, del caso enron (energia, ofertas y horarios) 
# para predecir si son relevantes o no a determinada investigacion en la corte
# en este caso reducian la capacidad de energi a califoria y la cobraban mas alto.
# Se tiene preentrenado un conjunto de emails relevantes para el caso

# e indicador (responsive: si es relevante o no para estudiar un caso)
#   str(emails)

print(strwrap(emails$email[1]))
emails$responsive[1]

print(table(emails$responsive))

# cargar dependencias, preprocesar y crear corpus
corpus = Corpus(VectorSource(emails$email))
# corpus[[1]]
corpus = tm_map(corpus, tolower)
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords("english"))
corpus = tm_map(corpus, stemDocument)

# imprimir el primero luego de preprocesado
print(strwrap(corpus[[1]]$content))

# crear matriz DocumentTerm
dtm = DocumentTermMatrix(corpus)
dtm

# se remueven los terminos que no son tan frecuentes
dtm = removeSparseTerms(dtm, 0.97)
dtm

# creear un dtaframe; la salida son las frecuencias de algunas palabras significativas dentro de
# los emails
labeledTerms = as.data.frame(as.matrix(dtm))
labeledTerms$responsive = emails$responsive
str(labeledTerms)

#








