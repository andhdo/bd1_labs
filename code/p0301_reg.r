if (!require("ggplot2")) {
  install.packages("ggplot2")
  library(ggplot2)
}

# algo de pre-procesamiento

ds_mtcars <- mtcars
ds_mtcars$cyl <- as.factor(ds_mtcars$cyl)
ds_mtcars$am <- factor(ds_mtcars$am,labels=c("Automatic", "Manual"))
ds_mtcars$vs <- as.factor(ds_mtcars$vs)
ds_mtcars$gear <- as.factor(ds_mtcars$gear)
ds_mtcars$carb <- as.factor(ds_mtcars$carb)

# ejemplo de regresion

model1 <- lm(formula = mpg ~., data=ds_mtcars)

summary(model1)


# se puede buscar el mejor modelo
bestmodel <- step(model1, direction="both")
summary(bestmodel)

# GRAFICO-1: ahora con estos datos podemos graficar por ejemplo
# a mpg como variable de horsePower)
# qplot(x=hp,y=mpg,data=ds_mtcars, facets = . ~ cyl)

q <- qplot(x=hp,y=mpg,data=ds_mtcars,geom=c("point","smooth"),label = rownames(ds_mtcars), method="lm")
q + geom_text(check_overlap = TRUE)