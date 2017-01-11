# vector de ejemplo
x <- c(12,2, 1, 2, 3, 1, 4, 1, 7,3,4.2,18,2,54,-21,8,3, 2, 4, -5,NA)

# calcular mean (se eliminan los valores nulos)
result.mean <-  mean(x, na.rm = TRUE)

# calcular median (se eliminan los valores nulos)
result.median <- median(x, na.rm = TRUE)

# calcular mode (en r no hay una funcion asi)
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# calcular median (se eliminan los valores nulos)
result.mode <- getmode(x)

# resultado
print(result.mean)
print(result.median)
print(result.mode)

