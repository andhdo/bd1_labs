# cargar la imagen y mostrarla
load("p0404_ds_face.rda")
image(t(faceData)[,nrow(faceData):1])

# ahora se calcula svd
# vemos que el primer vector explica casi el 40% de variacion, 
# el segundo un 20% y el 3ro un 15%
svd1 <- svd(scale(faceData))
plot(svd1$d^2/sum(svd1$d^2), pch=19,xlab="SingularVector", ylab="variabceExplained")

# entonces la idea es recortar los demas y dejar los primeros N
# el simbolo %*% se usa para multiplicacion de matrices
svd1 <- svd(scale(faceData))
# ... y recortamos
approx1 <- svd1$u[,1  ] %*%    t(svd1$v[,1]) * svd1$d[1]
approx5  <- svd1$u[,1:5 ] %*% diag(svd1$d[1:5] ) %*% t(svd1$v[,1:5] )    
approx10 <- svd1$u[,1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[,1:10])

par(mfrow=c(1,4))
image(t(approx1 )[,nrow(approx1 ):1],main="(a)")
image(t(approx5 )[,nrow(approx5 ):1],main="(a)")
image(t(approx10)[,nrow(approx10):1],main="(a)")
image(t(faceData)[,nrow(faceData):1],main="(a)")





