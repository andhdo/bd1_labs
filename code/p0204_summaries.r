if(!file.exists("./data")) {
  dir.create("./data")
}
# se obtienen los datos del dataset restaurantes a traves del api
# para verlos desde la pagina usar (https://data.baltimorecity.gov/Culture-Arts/Restaurants/k5ry-ef3g)
# este datast es de la ciudad de Baltimore, del estado de maryland

fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/restaurants.csv",method="curl")
restData <- read.csv("./data/restaurants.csv")

# algunas estadisticas basicas
summary(restData)
# informacion sobre los atributos/columnas
str(restData)

# councilDistricts son como los barrios de la ciudad