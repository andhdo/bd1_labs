
# ejemplo cross tabulation. Se usa un dataset de admisiones; se 
# calcula la frecuencia partida por genero y numero de admisiones
DF <- as.data.frame(UCBAdmissions)
xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt
