library(abc)
library(randomForest)

load('exercise1.RData')

abcestimates = abc(target = target, param = params, sumstat = sumstat, tol = .1, method = "rejection")
for(i in 1:3){
{
pdf(paste0('exercise1_hist_', c('tau', 'epsilon', 'NE')[i], '.pdf'))
hist(abcestimates[[1]][, i + 1], probability=T, col = rgb(0.05,0.3,0.1,.5))
hist(params[, i + 1], probability=T, col = rgb(.2,.6,0.75,.25), add = T)
abline(v = summary(abcestimates)[3, i + 1], lty = 1, lwd = 3, col = rgb(0, 1, 0, 1))
abline(v = summary(abcestimates)[4, i + 1], lty = 1, lwd = 3, col = rgb(0, 0, 1, 1))
abline(v = summary(abcestimates)[5, i + 1], lty = 1, lwd = 3, col = rgb(1, 0, 0, 1))
abline(v = quantile(abcestimates[[1]][, i + 1], c(.25,.75)), lty = 2, lwd = 3)
dev.off()
}
}

PCApost = princomp(abcestimates[[2]], scores = T)
{
pdf('exercise1_PCApost.pdf')
plot(0, 0, ylim = range(c(PCApost$scores[, 2], sum((target - PCApost$center) * PCApost$loadings[, 2]))), xlim = range(c(PCApost$scores[, 1], sum((target - PCApost$center) * PCApost$loadings[, 1]))), col='white')
points(PCApost$scores[,1 ], PCApost$scores[, 2], pch = 3, col = 'black')
points(sum((target - PCApost$center) * PCApost$loadings[, 1]), sum((target - PCApost$center) * PCApost$loadings[, 2]), pch = 2, col = 'green')
dev.off()
}

load('exercise2.RData')

cvhyper = cv4abc(param = params, sumstat = sumstat, nval = 5, tols = .1, method = "rejection", statistic = 'median')
for(i in c('zeta', 'tau1s', 'disp.index.tau')){
{
pdf(paste0('exercise1_cv_', i, '.pdf'))
plot(cvhyper[[4]][, 2], cvhyper[[5]][[1]][, 2], pch = 4)
abline(0,1,lty=2)
dev.off()
}
}

load('exercise3.RData')

abcrejection = NULL
for(i in 1:length(target)){
abcrejection = cbind(abcrejection, (sumstat[, i] - target[i])^2)
}
for(i in 1:nrow(abcrejection)){
abcrejection[i, 1] = (sum(abcrejection[i, ]))^.5
}
if(sort(abcrejection[, 1])[1] == sort(abcrejection[, 1])[(nrow(abcreults) * .1)]){
abcrejection = which(abcrejection[, 1] == sort(abcrejection[, 1])[1])
} else {
abcrejection = order(abcrejection[, 1])[1:10]
}
abcestimates = NULL
for(x in 1:ncol(params)){
abcestimates = c(abcestimates, mean(params[abcrejection, x]))
}

rf = randomForest(sumstat, params[, 1], ntree = 10, mtry = 119, proximity = T)
rfprediction = predict(rf, target)
