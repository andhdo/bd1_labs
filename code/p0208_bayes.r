if (!require("e1071")) { install.packages("e1071") }

library(e1071)

ds_playgolf <- read.csv("p0208_ds_playgolf.csv",header = TRUE)

model1 <- naiveBayes(PlayGolf ~ .,data=ds_playgolf)

# se arma matriz de confusion
table(predict(model1, ds_playgolf[,-5]), ds_playgolf[,5])

# se prueba con nuevo valor
# ds_new <- data.frame(Outlook = "Rainy", Temp="Hot", Humidty="High", Windy="False")
ds_new <- data.frame(Outlook = "Sunny", Temp="Cool", Humidty="High", Windy="True")

predict(model1, ds_new, type="class") # type=raw|class

