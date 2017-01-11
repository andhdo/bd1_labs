FROM rocker/rstudio
RUN apt-get update -qq \
 && apt-get install -y libjpeg-dev \
 && apt-get install -y libpng-dev \
 && apt-get install -y curl \
 && apt-get install -y libgtk2.0-dev \
 && apt-get install -y libxml2-dev


