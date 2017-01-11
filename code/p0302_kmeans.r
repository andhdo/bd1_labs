set.seed(1234)

# referencia de funciones:
# - par: preferencias del grafico: en este caso, margins
# - rep: replicar un numero n veces
#        en este caso se usa apra crear unos valores
#        normalmente distribuidos ceerca a 1, 2 o 3.

par(mar=c(0,0,0,0)) 
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1), each=4),sd=0.2)
plot(x,y,col="blue", pch=19,cex=2)
text(x+0.05,y+0.05,labels=as.character(1:12))

# al aplicar kmeans lo que obtenemos es un listado de la pertenencia 
# de unos puntos a determinado cluster: 

dataFrame <- data.frame(x,y)
kmeansObj <- kmeans(dataFrame, centers= 3)
names(kmeansObj)
print(kmeansObj$cluster)

# se pueden usar lso resutlados para usarlos en el grafico:
par(mar=rep(0.2,4))
plot(x,y,col=kmeansObj$cluster,pch=19,cex=2)
points(kmeansObj$centers,col=1:3,pch=3,cex=3,lwd=3)

