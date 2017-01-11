# explorar el dataset de ejemplo
help("mtcars")

# escalar el dataset (mean=0, sd=1)  y convertirlo en matrix
mtscaled <- as.matrix(scale(mtcars))

# crear el heatmap, sin escalar
heatmap(mtscaled, Colv=F, scale='none')
