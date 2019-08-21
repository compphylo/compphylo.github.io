library(MultiDICE)

output = dice.sims(num.sims = 501, num.taxa = 1, num.partitions = 3, num.haploid.samples = 10, num.ind.sites = 1000, tau.psi.prior = 0, tau.idio.prior = c(10000:5000000), epsilon.idio.prior = list(c(500:2000)/10000, c(1), 10000/c(500:2000)), NE.idio.prior = list(c(10000:100000),c(1000:100000),c(1000:10000)), output.hyper.draws = F, output.taxa.draws = T, fsc2path = 'fsc26', output.directory = '.')
