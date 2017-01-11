# cargar paquetes prerrequisito
if (!require("arules"))       { install.packages("arules")       }
if (!require("arulesViz"))   { install.packages("arulesViz")   }

library(arules)
library(arulesViz)
library(datasets)

data("Groceries")

# mostrar la frecuencia de items
itemFrequencyPlot(Groceries,topN=20,type="absolute")

# calculamos las reglas, con algunos parametros de soporte y confidence
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))
# luego se ordenan
rules <- sort(rules, by="confidence", decreasing=TRUE)

# mostramos las primeras N reglas, con solo 2 digitos
options(digits=2)
inspect(rules[1:8])