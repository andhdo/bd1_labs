# cargar paquetes prerrequisito
if (!require("rattle"))       { install.packages("rattle")       }
if (!require("rpart.plot"))   { install.packages("rpart.plot")   }
if (!require("RColorBrewer")) { install.packages("RColorBrewer") }

library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)


# descargar datasets de "https://www.kaggle.com/c/titanic/data"
train <- read.csv("p0303_ds_train.csv", stringsAsFactors=FALSE)
test  <- read.csv("p0303_ds_test_htsoft.csv",  stringsAsFactors=FALSE)

# examinar estructura, en general
# - pclass = passenger-class (1ra,2da,3ra clase)
# - pclass = passenger-class (1ra,2da,3ra clase)
# - embarked = puerto de embarque( C = Cherbourg; Q = Queenstown; S = Southampton)
str(train)

# ver cuanta gente se mato (en porcentaje)
print(prop.table(table(train$Survived)))

# 

fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,
             data=train,
             method="class")
# pintar el arbol
# - plot(fit)
# - text(fit)
fancyRpartPlot(fit)

# usar los datos para predecir
Prediction <- predict(fit, test, type = "class")

submit <- data.frame(Name = test$Name, Survived = Prediction)
print(submit)


# predecir un registro
#ds_new <- data.frame(
#  PassengerId = "X-1", 
#  Pclass = 2,
#  Name = 'Andres Barrantes',
#  Sex = 'male',
#  Age = 35,
#  SibSp = 0,
#  Parch = 0,
#  Ticket = 'X-A',
#  Fare = 7.92,
#  Cabin = 'X-C',
#  Embarked = 'S' )



