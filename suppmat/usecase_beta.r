par(mfrow=c(2,2), pty='s')
with(BetaDiv,{
     plot(GEO, S, pch=22, bg='lightgrey', cex=1.5, lwd=1.5,
          xlab="Geographic distance", ylab="Species composition dissimilarity")
     plot(GEO, WN, pch=22, bg='lightgrey', cex=1.5, lwd=1.5,
          xlab="Geographic distance", ylab="Network dissimilarity (all species)")
     plot(GEO, OS, pch=22, bg='lightgrey', cex=1.5, lwd=1.5,
          xlab="Geographic distance", ylab="Network dissimilarity (shared species)")
})
