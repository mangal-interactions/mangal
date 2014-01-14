if(getOption('unzip') == '') options('unzip' = 'unzip')
library(devtools)
# Get the "betalink" package to measure network beta-diversity
install_github('betalink', 'tpoisot')
library(betalink)
# The sp package is needed for distance measures
library(sp)

library(rmangal)

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

# Then we measure the distances between all pairs of sites
GeoDist <- spDists(as.matrix(LatLon, latlon=TRUE))
colnames(GeoDist) <- rownames(GeoDist) <- rownames(LatLon)
GeoDist <- as.dist(GeoDist)

# Now, we measure the beta-diversity of the networks
# First, we get each network as a graph
Graphs <- llply(Networks, function(x) toIgraph(api, x$id))
names(Graphs) <- aaply(names(Graphs), 1, function(x) Networks[[x]]$name)
# Next, we convert the graphs in matrices
Matrices <- llply(Graphs, get.adjacency, sparse=FALSE)
# Finally, we measure the beta-diversity
BetaDiv <- betalink.dist(Matrices)

# We add the geographic distance
BetaDiv$GEO <- GeoDist

# And we do some plots
par(mfrow=c(2,2), pty='s')
with(BetaDiv,{
     plot(GEO, S, pch=22, bg='lightgrey', cex=1.5, lwd=1.5, xlab="Geographic distance", ylab="Species composition dissimilarity")
     plot(GEO, WN, pch=22, bg='lightgrey', cex=1.5, lwd=1.5, xlab="Geographic distance", ylab="Network dissimilarity (all species)")
     plot(GEO, OS, pch=22, bg='lightgrey', cex=1.5, lwd=1.5, xlab="Geographic distance", ylab="Network dissimilarity (shared species)")
})

