library(bigmemory)
library(MultiDICE)

target = NULL
sumstat = NULL
params = NULL
for(x in 1:3){
sims = read.big.matrix(paste0('dice.simulations', x), sep = '\t')[, 1:9]
target = rbind(target, sims[1,] / sum(sims[1,]))
sumstat = rbind(sumstat, sims[2:501,])
param = rep(x, 500)
for(y in c('tau', 'epsilon', 'NE')){
param = cbind(param, read.big.matrix(paste('dice.sims.taxa.draws', y, sep = '.'), sep = ' ')[2:501, 1])
}
params = rbind(params, param)
}
rm(sims)
save.image('exercise1.RData')

sims = dice.aSFS(num.sims = 501, num.taxa = 10, num.haploid.samples = 10, input.directory = 'exercise2')
target = sims[1,]
sumstat = sims[2:501,]
rm(sims)
params = NULL
for(y in c('zeta.tau.1', 'pulse.values.tau', 'disp.index.tau')){
params = cbind(params, as.matrix(read.table(paste('exercise2/dice.sims.hyper.draws', y, sep = '.'))))
}
params = params[2:501,]
save.image('exercise2.RData')

sims = dice.aSFS(num.sims = 501, num.taxa = 10, num.haploid.samples = 120, folded = F, input.directory = '.', input.base = 'exercise3.SFS.')
sims = sims[, sims[1,] != 0]
target = sims[1,]
sumstat = sims[2:501,]
rm(sims)
params = NULL
for(y in c('zeta', 'tau1s', 'deltatau1', 'omegatau1', 'meantau1', 'deltatau2', 'omegatau2', 'meantau2')){
params = cbind(params, as.matrix(read.table(paste('exercise3', y, sep = '.'))))
}
params = params[2:501,]
save.image('exercise3.RData')
