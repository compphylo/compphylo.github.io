#exercise3_MSFS.obs

echo "zeta = sample(1:10, 1, replace = T) / 10
tau1s = sample(10000:5000000, 1, replace = T)
beta = round(exp(.95 * log(tau1s))):round(exp(1.05 * log(tau1s)))
tau1 = c(rep(tau1s, (zeta * 10)), sample(c(10000:5000000)[!c(10000:5000000) %in% beta], ((1 - zeta) * 10), replace = T))
TIMEP = sample(2000:8000, 10, replace = T) / 10000
tau2 = round(TIMEP * tau1)
NM1 = exp(sample(round((log(1e-3) * 10000)):round((log(5) * 10000)), 10, replace = T) / 10000)
NM2 = exp(sample(round((log(1e-3) * 10000)):round((log(5) * 10000)), 10, replace = T) / 10000)
NM3 = exp(sample(round((log(1e-3) * 10000)):round((log(5) * 10000)), 10, replace = T) / 10000)
NM4 = exp(sample(round((log(1e-3) * 10000)):round((log(5) * 10000)), 10, replace = T) / 10000)
RESIZE0 = exp(sample(round((log(.1) * 10000)):round((log(1) * 10000)), 10, replace = T) / 10000)
RESIZE1 = exp(sample(round((log(1) * 10000)):round((log(10) * 10000)), 10, replace = T) / 10000)
NPOP0 = sample(10000:1000000, 10, replace = T)
NPOP1 = sample(1000:50000, 10, replace = T)
MIG1 = NM1 / NPOP0
MIG2 = NM2 / NPOP1
MIG3 = NM3 / NPOP0
MIG4 = NM4 / NPOP1
write.table(rbind(tau1, tau2, NM1, NM2, NM3, NM4, RESIZE0, RESIZE1, NPOP0, NPOP1, TIMEP, MIG1, MIG2, MIG3, MIG4), 'exercise3.draws', row.names = F, col.names = F)
write.table(c(zeta, tau1s, mean(abs(tau1 - median(tau1))), var(tau1) / mean(tau1), mean(tau1), mean(abs(tau2 - median(tau2))), var(tau2) / mean(tau2), mean(tau2)), 'exercise3.hyperdraws', row.names = F, col.names = F)
" >exercise3.R

echo "//Number of population samples (demes)
2
//Population effective sizes (number of genes)
NPOP0
NPOP1
//Samples sizes and samples age
10
10
//Growth rates: negative growth implies population expansion
0
0
//Number of migration matrices : 0 implies no migration between demes
3
//Migration matrix 0
0 MIG1
MIG2 0
//Migration matrix 1
0 MIG3
MIG4 0
//Migration matrix 2
0 0
0 0
//historical event: time, source, sink, migrants, new deme size, growth rate, migr mat index
3 historical events
tau2 0 0 0 RESIZE0 0 1
tau2 1 1 0 RESIZE1 0 1
tau1 0 1 1 1 0 2
//Number of independent loci [chromosome]
1 0
//Per chromosome: Number of contiguous linkage Block: a block is a set of contiguous loci
1
//per Block:data type, number of loci, per gen recomb and mut rates
FREQ 1 0 0 OUTEXP
" >exercise3.template.par

for x in {1..501}
do

R -s <exercise3.R >/dev/null 2>&1

cat exercise3.draws | awk "NR == 1" >>exercise3.tau1
cat exercise3.draws | awk "NR == 2" >>exercise3.tau2
cat exercise3.draws | awk "NR == 3" >>exercise3.NM1
cat exercise3.draws | awk "NR == 4" >>exercise3.NM2
cat exercise3.draws | awk "NR == 5" >>exercise3.NM3
cat exercise3.draws | awk "NR == 6" >>exercise3.NM4
cat exercise3.draws | awk "NR == 7" >>exercise3.RESIZE0
cat exercise3.draws | awk "NR == 8" >>exercise3.RESIZE1
cat exercise3.draws | awk "NR == 9" >>exercise3.NPOP0
cat exercise3.draws | awk "NR == 10" >>exercise3.NPOP1
cat exercise3.draws | awk "NR == 11" >>exercise3.TIMEP
cat exercise3.draws | awk "NR == 12" >>exercise3.MIG1
cat exercise3.draws | awk "NR == 13" >>exercise3.MIG2
cat exercise3.draws | awk "NR == 14" >>exercise3.MIG3
cat exercise3.draws | awk "NR == 15" >>exercise3.MIG4
cat exercise3.hyperdraws | awk "NR==1" >>exercise3.zeta
cat exercise3.hyperdraws | awk "NR==2" >>exercise3.tau1s
cat exercise3.hyperdraws | awk "NR==3" >>exercise3.deltatau1
cat exercise3.hyperdraws | awk "NR==4" >>exercise3.omegatau1
cat exercise3.hyperdraws | awk "NR==5" >>exercise3.meantau1
cat exercise3.hyperdraws | awk "NR==6" >>exercise3.deltatau2
cat exercise3.hyperdraws | awk "NR==7" >>exercise3.omegatau2
cat exercise3.hyperdraws | awk "NR==8" >>exercise3.meantau2

for y in {1..10}
do
cat exercise3.draws | cut -d ' ' -f ${y} >exercise3.draw
cat exercise3.template.par | sed -e "s/tau1/`cat exercise3.draw | awk 'NR == 1'`/g" -e "s/tau2/`cat exercise3.draw | awk 'NR == 2'`/g" -e "s/RESIZE0/`cat exercise3.draw | awk 'NR == 7'`/g" -e "s/RESIZE1/`cat exercise3.draw | awk 'NR == 8'`/g" -e "s/NPOP0/`cat exercise3.draw | awk 'NR == 9'`/g" -e "s/NPOP1/`cat exercise3.draw | awk 'NR == 10'`/g" -e "s/MIG1/`cat exercise3.draw | awk 'NR == 12'`/g" -e "s/MIG2/`cat exercise3.draw | awk 'NR == 13'`/g" -e "s/MIG3/`cat exercise3.draw | awk 'NR == 14'`/g" -e "s/MIG4/`cat exercise3.draw | awk 'NR == 15'`/g" >exercise3.par
./fsc26_linux64/fsc26 -i exercise3.par -n 1000 -m -c 1 --multiSFS >/dev/null 2>&1
cat exercise3/exercise3_MSFS.txt | awk 'NR == 3' >>exercise3.SFS.${y}
done

done

rm -r exercise3.R exercise3.template.par exercise3.draws exercise3.hyperdraws exercise3.draw exercise3.par exercise3 seed.txt
