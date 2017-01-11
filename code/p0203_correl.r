if (!require("corrplot")) {
  install.packages("corrplot")
  library(corrplot)
}
# se calculan los coeficientes de correlacion
res <-cor(mtcars)
# luego se grafican; 
corrplot(res)
# por ejemplo las variables {cyl:cilindraje, disp:displacement, 
#    hp:horsepower,wt:weight} parecen tener una correlacion alta 
#    con la variable {mpg:miles-per-galoon}, pese a ser negativa 
#    (incremtnos de estas variables dan como resultado menor 
#    numero de millas por galon)

# otra forma de ver las graficas es mediante:
pairs(mtcars)

# luego de explorar la correlacion, un tipo de modelo comunmente usado es la regresion lineal
model1 <- lm(formula = mpg ~., data=mtcars)
summary(model1)
