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
plot(jitter(L)~jitter(S), ls, log='xy', pch=22, bg='lightgrey', lwd=1.5, cex=1.5, xlim=c(5, 15), xlab='Species richness', ylab='Number of interactions')
# Constant connectance
X <- c(1:15)
Y <- X^2 * mean(ls$L/ls$S^2)
lines(X, Y, lty=2)
# Best fit
bfit <- lm(L~S, ls)
Yf <- X * bfit$coefficients[2] + bfit$coefficients[1]
lines(X, Yf)
legend('bottomright',pch=c(22, NA, NA), lty=c(NA, 2, 1), pt.cex=c(1.5, 1, 1), lwd=c(1.5, 1, 1), pt.bg=c('lightgrey', NA, NA), legend=c('Data', 'Constant connectance', 'Best fit (linear model)'), bty='n')
