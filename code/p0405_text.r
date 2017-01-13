# depedencias
if (!require("tm")       ) { install.packages("tm"       ) }
if (!require("SnowballC")) { install.packages("SnowballC") }
if (!require("caTools"))   { install.packages("caTools") }

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

# luego con el corpus se crea un modelo
# para crear el modelo se dividen los datos en el set de entrenamiento y el set de prueba

library(caTools)

set.seed(144)
spl = sample.split(labeledTerms$responsive, 0.7)

train = subset(labeledTerms, spl == TRUE)
test = subset(labeledTerms, spl == FALSE)

library(rpart)
library(rpart.plot)

# para el caso se va a usar un modelo de arbol de decision
# usando CART (ClassificationAndRegressionTrees). La variable label es "responsive"
# y se entrena con los demas datos. La funcion prp se usa para graficar el arbol
emailCART = rpart(responsive ~ . , data=train, method="class" )
prp(emailCART)

# en la parte superior se observa la aparicion de la palabra california
# (enron tenia problemas por vender energia el california, uno de los estados mas poblados)
# tambien aparecen las palabras gas, bid:oferta, system
# se encuentra la palabra Jeff, quien era el CEO de enron y está enjaulado 

# ahora vamos a predecir
pred = predict(emailCART,newdata=test)
# se imprimen los resultados; la primera columna indica la probabildiad de ser no-responsive
print(pred[1:10,])
# usamos la segunda columna (es relevante el documento) y revisamos los documentos
# que tengan un valor superior a 0.5
pred.prob = pred [,2]
table(test$responsive,pred.prob >=0.5)

# para este caso vemos 195 documentos en los que se predijo falso y efectivamente no son relevantes
# y 25 de los que efectivamente son relevantes y asi se predijo.
# el accuracy es de:
(195+25)/(195+20+17+25)
