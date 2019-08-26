install.packages('abc')
install.packages('randomForest')
library(abc)
library(randomForest)

load('exercise1.RData')

abcestimates = NULL
for(i in 1:3){
abcestimates = append(abcestimates, list(abc(target = target[i,], param = params, sumstat = sumstat, tol = .1, method = "rejection")))
{
pdf(paste0('exercise_hist_model_', c('expansion', 'constant', 'contraction')[i], '.pdf'))
hist(abcestimates[[i]][[1]][, 1], probability=T, col = rgb(0.05,0.3,0.1,.5))
hist(params[, 1], probability=T, col = rgb(.2,.6,0.75,.25), add = T)
dev.off()
}
for(j in 1:3){
{
pdf(paste0('exercise_hist_', c('tau', 'epsilon', 'NE')[j], '_', c('expansion', 'constant', 'contraction')[i], '.pdf'))
hist(abcestimates[[i]][[1]][, j + 1], probability=T, col = rgb(0.05,0.3,0.1,.5))
hist(params[, j + 1], probability=T, col = rgb(.2,.6,0.75,.25), add = T)
abline(v = summary(abcestimates[[i]])[3, j + 1], lty = 1, lwd = 3, col = rgb(0, 1, 0, 1))
abline(v = summary(abcestimates[[i]])[4, j + 1], lty = 1, lwd = 3, col = rgb(0, 0, 1, 1))
abline(v = summary(abcestimates[[i]])[5, j + 1], lty = 1, lwd = 3, col = rgb(1, 0, 0, 1))
abline(v = quantile(abcestimates[[i]][[1]][, j + 1], c(.25,.75)), lty = 2, lwd = 3)
dev.off()
}
}
}

PCApost = princomp(abcestimates[[i]][[2]], scores = T)
{
pdf('exercise_PCApost.pdf')
plot(0, 0, ylim = range(c(PCApost$scores[, 2], sum((target - PCApost$center) * PCApost$loadings[, 2]))), xlim = range(c(PCApost$scores[, 1], sum((target - PCApost$center) * PCApost$loadings[, 1]))), col='white')
points(PCApost$scores[,1 ], PCApost$scores[, 2], pch = 3, col = 'black')
points(sum((target - PCApost$center) * PCApost$loadings[, 1]), sum((target - PCApost$center) * PCApost$loadings[, 2]), pch = 2, col = 'green')
dev.off()
}

load('exercise2.RData')

cvhyper = cv4abc(param = params, sumstat = sumstat, nval = 5, tols = .1, method = "rejection", statistic = 'median')
for(i in 1:3){
{
pdf(paste0('exercise_cv_', c('zeta', 'tau1s', 'omega.tau')[i], '.pdf'))
plot(cvhyper[[4]][, i], cvhyper[[5]][[1]][, i], pch = 4)
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
if(sort(abcrejection[, 1])[1] == sort(abcrejection[, 1])[(nrow(abcrejection) * .1)]){
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
