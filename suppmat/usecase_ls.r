plot(jitter(L)~jitter(S), ls, log='xy', pch=22, bg='lightgrey',
     lwd=1.5, cex=1.5, xlab='Species richness', ylab='Number of interactions')
# Constant connectance
X <- c(1:max(ls$S))
Y <- X^2 * mean(ls$L/ls$S^2)
lines(X, Y, lty=2)
# Best fit
bfit <- lm(L~S, ls)
Yf <- X * bfit$coefficients[2] + bfit$coefficients[1]
lines(X, Yf)
legend('bottomright',pch=c(22, NA, NA), lty=c(NA, 2, 1),
       pt.cex=c(1.5, 1, 1), lwd=c(1.5, 1, 1), pt.bg=c('lightgrey', NA, NA),
       legend=c('Data', 'Constant connectance', 'Best fit (linear model)'), bty='n')
