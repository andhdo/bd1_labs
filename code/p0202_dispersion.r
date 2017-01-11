dataset = faithful
dataset$duration = faithful$eruptions
print(var(dataset$duration))
print(range(dataset$duration, na.rm = TRUE))
# tal vez mas diciente con un boxplot... que veremos mas adelante
boxplot(dataset$duration)
dataset$zscore = scale(dataset$duration,center=TRUE,scale=TRUE)
print(dataset)
# ahora se puede ver estandarizado
# boxplot(dataset$zscore)