# datos de nivel de pasajeros a traves del tempo
data(AirPassengers)
plot(AirPassengers)

# graficar la linea de regresion
abline(reg=lm(AirPassengers~time(AirPassengers)))
# graficar solo la media a lo largo de los años
plot(aggregate(AirPassengers,FUN=mean))

# usar un analisis de series de tiempo para computar 
# basicamente se busca la tendencia, se quita y se busca algun patron
# de estacionalidad; con el se ajusta un modelo y se usa posteriormente
# para predecir los futuros 12 años posteriores a la medicion

(fit <- arima(log(AirPassengers), c(0, 1, 1),seasonal = list(order = c(0, 1, 1), period = 12)))
pred <- predict(fit, n.ahead = 10*12)
ts.plot(AirPassengers,2.718^pred$pred, log = "y", lty = c(1,3))
# REF:https://www.analyticsvidhya.com/blog/2015/12/complete-tutorial-time-series-modeling/