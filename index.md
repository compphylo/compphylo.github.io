# Model-based inference in Phylogeography from single species to communities

CompPhylo workshops are designed to introduce a myriad of tools for making 
statistical inference about historical processes using genetic/genomic data. 
After introducing statistical approaches in model-based inferences, participants
will be introduced to inference frameworks that span taxonomic scales from 
single-species demographic inference, to multi-species comparative analysis, to
inference at the scale of the whole community. Participants will also get hands
on experience using approximate Bayesian computation, supervised machine 
learning and composite likelihood methods for model comparison.

Participants will work on sample datasets but are also encouraged to bring their 
own data. Advantages and limitations of each method and the fit to participant's 
datasets, field sampling design as well as the selection and use of genetic 
markers will be actively discussed. In addition, to strengthen connections and 
exchanges between researchers, participants will have the opportunity to present 
their own work in the evenings.

## Upcoming events:
* [CompPhylo2019-Oslo](Oslo2019/index.md)

## Details about methods

### ABLE
Composite likelihood methods for model comparison using the ABLE package authored by C. Beeravolu Reddy

* What kind of data it uses:
* Documentation:
* Software: 
 
### MESS
MESS is a novel comparative phylogeographic model grounded in community 
ecological theory will be introduced. This integrative approach makes use of 
four data axes (distributions of traits, abundances, genetic diversities/
divergences, and phylogenetic patterns) to enable testing alternative community 
assembly models (neutral vs non-neutral) and estimating parameters underlying 
different assembly processes (e.g. dispersal vs in situ speciation). These 
methods which capitalize on the widespread use of DNA barcoding and 
meta-barcoding approaches will be implemented in the software package MESS 
designed by I. Overcast.

* What kind of data it uses: MESS requires population-level sampling (5-10
individuals per species) at the scale of the whole community. Currently
only single locus data is supported, so community metabarcoding projects
would be quite appropriate.
* Documentation: [MESS documentation](https://pymess.readthedocs.io/en/latest/)
* Software: [MESS GitHub](https://github.com/messDiv/MESS)

### Multi-DICE
multi-taxa demographic inferences using hierarchical models in the R packages 
multi-DICE and PipeMaster authored by A. Xue and M. Gehara respectively. Finally, 

* What kind of data it uses:
* Documentation:
* Software:

### PipeMaster
multi-taxa demographic inferences using hierarchical models in the R packages 
multi-DICE and PipeMaster authored by A. Xue and M. Gehara respectively. Finally, 

* What kind of data it uses:
* Documentation:
* Software:


## What is phylogeography/comparative phylogeography?

* Avise et al 1987 - [Intraspecific phylogeography: the mitochondrial DNA bridge between population genetics and systematics](https://www.annualreviews.org/doi/abs/10.1146/annurev.es.18.110187.002421?casa_token=SX6e0jhz_4AAAAAA%3AUL0JkNNGtYflMzIK3Ms599rVgKaSP5pZtJzN_b_4jPcWKYN7IYiBujLi4PdVlqVnNuxcWBxXfNI&journalCode=ecolsys.1)
* Avise 2000 - [Phylogeography: the history and formation of species](https://books.google.com/books?hl=en&lr=&id=lA7YWH4M8FUC&oi=fnd&pg=PA1&dq=phylogeography+avise+2000&ots=LxuM-7oQbK&sig=tb1___1H_c2cc-VEMRQvUHP0keM#v=onepage&q=phylogeography%20avise%202000&f=false)
* Arbogast & Kenagy 2008 - [Comparative phylogeography as an integrative approach to historical biogeography](https://onlinelibrary.wiley.com/doi/full/10.1046/j.1365-2699.2001.00594.x)
* Hickerson et al 2010 - [Phylogeography's past, present, and future: 10 years after Avise, 2000](https://www.sciencedirect.com/science/article/pii/S105579030900373X)

## Who should attend?
CompPhylo workshops are geared toward practicing field biologists with little
or no computational experience. General knowledge in evolutionary biology, 
population genetic and phylogenetic analyses. Basic knowledge in R. bash/Linux 
and python scripting/commands scripting is useful.

Workshop attendees will need to bring a laptop computer.

## Past events:

## References

Beeravolu, CR, Hickerson, MJ, Frantz, LA, & Lohse, K (2018). ABLE: blockwise site frequency spectra for inferring complex population histories and recombination. Genome biology, 19(1), 145.

Gehara, M, Garda, AA, Werneck, FP, Oliveira, EF, da Fonseca, EM, Camurugi, F, ... & Silveira-Filho, R (2017). Estimating synchronous demographic changes across populations using hABC and its application for a herpetological community from northeastern Brazil. Molecular ecology, 26(18), 4756-4771.

Overcast, I, Emerson, BC, Hickerson, MJ. (2019). An integrated model of population genetics and community ecology. Journal of Biogeography, 46: 816-829. [https://doi.org/10.1111/jbi.13541](https://doi.org/10.1111/jbi.13541)

Xue, AT, & Hickerson, MJ (2017). multi-dice: r package for comparative population genomic inference under hierarchical co-demographic models of independent single-population size changes. Molecular ecology resources, 17(6), e212-e224.

## Acknowledgements

[PoreCamp](https://porecamp.github.io/) - Which inspired the design of this workshop and also of this site.
[RADCamp](https://radcamp.github.io/) - RAD-Seq assembly and analysis workshop resources.
