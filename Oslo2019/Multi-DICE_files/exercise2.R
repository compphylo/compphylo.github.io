library(MultiDICE)

system('mkdir exercise2')

output = dice.sims(num.sims = 1001, num.taxa = 10, num.partitions = 1, num.haploid.samples = 10, num.ind.sites = 1000, tau.psi.prior = c(1), tau.zeta.prior = c(1:10/10), tau.shared.prior = c(10000:5000000), tau.buffer = 15000, epsilon.idio.prior = c(500:2000)/10000), NE.idio.prior = c(10000:100000), disp.index.tau = T, fsc2path = 'fsc25221', output.directory = 'exercise2')
