# Plot a map
center_point <- colMeans(sp_center)
vcolors <- c(brewer.pal(9, "Set1"), brewer.pal(8, "Set2"))

Layout <- matrix(c(1,2,2,2), 2, 2)
colSize <- c(1.3, 2.0)
rowSize <- c(1.2, 2)
layout(Layout, colSize, rowSize)

# Inset map is number 1
par(mar=c(4.5, 1, 1, 4))
map("worldHires", xlim=c(90,136), ylim=c(-15,15), col="gray90",
      fill=TRUE, resolution=0)
points(center_point[2], center_point[1], pch=1, cex=2, lwd=2)
box()

par(mar=c(4.1, 4.1, 4.1, 4.1))
map("worldHires", xlim=c(124.0,125.1), ylim=c(1.2,1.9), col="gray90",
      fill=TRUE, resolution = 0)
plot(Mw, layout = jitter(as.matrix(LatLon[,c('lon','lat')])),
      rescale = FALSE, add = TRUE, vertex.color = vcolors, vertex.size = 1,
      vertex.label = NA, edge.arrow.size = 0.25, edge.color = 1)
axis(1)
axis(4)
legend("bottomleft", fill = vcolors, legend = V(Mw)$name, inset = 0.02,
      cex = 0.7, bty = "n", ncol=2)
