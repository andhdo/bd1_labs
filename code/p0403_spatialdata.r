if (!require("ggmap")) {
  install.packages("jpeg",dependencies =TRUE)
  install.packages("png",dependencies =TRUE)
  install.packages("rjson",dependencies =TRUE)
  install.packages("RgoogleMaps",dependencies =TRUE)
  install.packages("ggmap",dependencies =TRUE)
  library(ggmap)
}

set.seed(500)

# crear algunos puntos alrededor de un centro
df <- round(data.frame(
  lat = jitter(rep(  4.660858, 50), amount = .003),
  lon = jitter(rep(-74.103667, 50), amount = .003)
), digits = 5)

# crear el mapa sobre ese centro
localizacion <- c(lat=4.660858,lon=-74.103667)
map <- get_map(location=localizacion,  zoom= 16, source="google", maptype="roadmap", crop=TRUE)

# dibular el mapa
p <- ggmap(map, extent ='device') 
p <- p + geom_point(data=df, aes(x=lon, y=lat), 
     size=5, alpha=.5, color='red') + scale_color_gradient(low="beige", high="blue")
p

