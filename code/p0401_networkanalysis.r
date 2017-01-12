if (!require("igraph")) { install.packages("igraph") }
library(igraph)

# Specify an undirected graph by hand, using a numeric   
# vector of the pairs of vertices sharing an edge.
G <- graph( c(1,2,1,3,1,4,3,4,3,5,5,6,6,7,7,8,8,9,3,8,5,8), directed = FALSE )

# visualization
plot(G, layout = layout.fruchterman.reingold,
     vertex.size = 25,
     vertex.color="red",
     vertex.frame.color= "white",
     vertex.label.color = "white",
     vertex.label.family = "sans",
     edge.width=2,  
     edge.color="black")

# camino mas corto
get.shortest.paths(G, from='1', to='9')