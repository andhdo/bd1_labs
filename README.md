# DESCRIPCION
- ejecuta un rstudio-server desde docker
- la versión mas simple de rstudio, sin spark

# EJECUTAR
docker-compose up

# ENDUSER

> http://<docker-machine-ip>:8787
> user:rstudio
> password:rstudio

posteriormente y en la consola R fijar el directorio de inicio

> setwd("/code")

ejecutar alguno de los archivos

> source("o0201_heatmaps.r")


# ENTRAR
docker exec -it $(docker-compose ps -q rstudio) /bin/sh
cd /code

# REFERENCIAS
* [rstudio-docker-1](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image)
* [rstudio-docker-2](https://hub.docker.com/r/beniyama/sparkr-docker/)
* [sparkR+docker+aws](http://amunategui.github.io/sparkr/)

