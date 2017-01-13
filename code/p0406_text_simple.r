
# otro ejemplo
# un dataframe sencillo
ds1 <- data.frame(a_word=c("estabamos comiendo helado", "me gusta el helado", "odio el helado"), idx=c('A1','A2','A3'))
ds1_corpus <- Corpus(VectorSource(ds1$a_word))
ds1_dtm <- DocumentTermMatrix(ds1_corpus)

labeled <- as.data.frame(as.matrix(ds1_dtm))
labeled$idx=ds1$idx
print(labeled)