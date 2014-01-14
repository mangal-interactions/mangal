library(rmangal)

url <- "http://localhost:8000"
DAT_ID <- 1
api <- mangalapi(url)

# Pull the dataset of interest
dat <- getDataset(api, DAT_ID)

# Get each network in the dataset as a graph object
graphs <- alply(dat$networks, 1, function(x) toIgraph(api, x))

# Make a data.frame with the number of links and species
ls <- ldply(graphs, function(x) c(S = length(V(x)), L = length(E(x))))
ls$X1 <- aaply(as.numeric(as.vector(ls$X1)), 1, function(x) getNetwork(api, x)$name)
colnames(ls)[1] <- 'Network'

# Now plot this dataset
plot(jitter(L)~jitter(S), ls, log='xy', pch=22, bg='lightgrey', lwd=1.5, cex=1.5)

