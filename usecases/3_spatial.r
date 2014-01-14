# We need package to plot networks over a map
library(RColorBrewer)
library(betalink)
library(rmangal)
library(maps)
library(mapdata)

DSET_ID <- 1

# We connect to the API
api <- mangalapi('http://localhost:8000')

# We retrieve the dataset
dataset <- getDataset(api, DSET_ID)

# And we retrieve all of the network informations
Networks <- alply(dataset$networks, 1, function(x) getNetwork(api, x))

# Extract the lat/lon data
LatLon <- ldply(Networks, function(x) c(name = x$name, lat = x$latitude, lon = x$longitude))
rownames(LatLon) <- LatLon$name
LatLon$lat <- as.numeric(LatLon$lat)
LatLon$lon <- as.numeric(LatLon$lon)
LatLon <- LatLon[,c('lat', 'lon')]

# First, we get each network as a graph
Graphs <- llply(Networks, function(x) toIgraph(api, x$id))
names(Graphs) <- aaply(names(Graphs), 1, function(x) Networks[[x]]$name)
# Next, we convert the graphs in matrices
Matrices <- llply(Graphs, get.adjacency, sparse=FALSE)

# We now fill a community data matrix
sp_by_site <- llply(Graphs, function(x) unlist(V(x)$name))
sp_list <- unique(unlist(sp_by_site))
M <- matrix(0, ncol = length(sp_list), nrow = length(sp_by_site))
colnames(M) <- sp_list
rownames(M) <- names(sp_by_site)
for (site in c(1:length(sp_by_site))) M[names(sp_by_site)[site], sp_by_site[[site]]] = 1

# Next, we get the center position for each species (i.e. the mean position of the sites it occurs at)
sp_center <- adply(M, 2, function(x) colMeans(LatLon[names(x)[x > 0], ]))
rownames(sp_center) <- sp_center[, 1]
sp_center <- sp_center[, -1]

# We now create a regional network using betalink::metaweb
Mw <- graph.adjacency(metaweb(Matrices)$web)

# Plot a map
center_point <- colMeans(sp_center)
colors <- c(brewer.pal(9, "Set1"), brewer.pal(8, "Set2"))


Layout <- matrix(c(1,2,2,2), 2, 2)
colSize <- c(1.3, 2.0)
rowSize <- c(1.2, 2)
layout(Layout, colSize, rowSize)

# Inset map is number 1
par(mar=c(4.5, 1, 1, 4))
map("worldHires", xlim=c(90,136), ylim=c(-15,15), col="gray90", fill=TRUE, resolution=0)
points(center_point[2], center_point[1], pch=1, cex=2, lwd=2)
box()

par(mar=c(4.1, 4.1, 4.1, 4.1))
map("worldHires", xlim=c(124.0,125.1), ylim=c(1.2,1.9), col="gray90", fill=TRUE, resolution = 0)
plot(Mw, layout = jitter(as.matrix(LatLon[,c('lon','lat')])), rescale = FALSE, add = TRUE, vertex.color = colors, vertex.size = 1, vertex.label = NA, edge.arrow.size = 0.25, edge.color = 1)
axis(1)
axis(4)
legend("bottomleft", fill = colors, legend = V(Mw)$name, inset = 0.02, cex = 0.7, bty = "n", ncol=2)


