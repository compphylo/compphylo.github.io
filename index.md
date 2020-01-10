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
* [CompPhylo2020-Leipzig](Leipzig2020/index.md)

## Past Events:
* [CompPhylo2019-Oslo](Oslo2019/index.md)

## Details about methods

### ABLE
`ABLE` is a composite likelihood method for the joint inference of arbitrary population histories and the genome-wide recombination rate. It makes use of the distribution of blockwise SFS (bSFS) patterns which retain information on the variation in genealogies spanning short-range linkage blocks across the genome. `ABLE` does not require phased data as the bSFS does not distinguish the sampled lineage in which a mutation has occurred. Like with the SFS, outgroup information can be also be ignored by folding the bSFS. `ABLE` takes advantage of `openmp` parallelization and is tailored for studying population histories of model as well as non-model species.

`ABLE` stands for Approximate Blockwise Likelihood Estimation. It is written in C/C++ and authored by [Champak Beeravolu Reddy](https://www3.unifr.ch/directory/fr/people/286145/0d8d0)

* What kind of data it uses: `ABLE` can use data from multiple whole genome sequences or fragmented assemblies (e.g. UCE's, RADSeq or targeted exomes). In many aspects `ABLE` uses the same type of data as the `PipeMaster` method mentioned further below.
* Documentation: "[helpABLE](https://github.com/champost/ABLE/blob/master/doc/helpABLE.pdf)"
* Software: [ABLE](https://github.com/champost/ABLE)
* Reference: **Beeravolu, CR, Hickerson, MJ, Frantz, LA, & Lohse, K (2018).** [ABLE: blockwise site frequency spectra for inferring complex population histories and recombination. Genome biology, 19(1), 145](https://doi.org/10.1186/s13059-018-1517-y).

### CAMI
**CAMI** employs a stochastic algorithm to simulate communities assembled under environmental filtering, competitive exclusion, and neutral species assembly processes -simultaneously considering phylogenetic and phenotypic information from species in local and regional communities. CAMI parameterizes the relative strength of the assembly processes to mimic strong to weak non-neutral assembly. CAMI implements a model-based inference procedure by using two approximate approaches, random forests and approximate Bayesian computation. Additionally, because the strength of non-neutral assembly models is parameterized, the strength parameter can be estimated.

**CAMI** stands for Community Assembly Model Inference and is implemented as an R package.

* What kind of data it uses: CAMI uses phylogenetic information from species in a regional community pool and local community pool, along with continuous trait information for each species present in the phylogenies.
* CompPhylo Webpage: [CAMI_Monday_afternoon](https://compphylo.github.io/Oslo2019/CAMI_files/CAMI.html)
* Software: [CAMI github](https://github.com/ruffleymr/CAMI)
* References: Ruffley M, Peterson K, Week B, Tank DC, Harmon LJ. **2019** Identifying Models of Trait-Mediated Community Assembly Using Random Forests and Approximate Bayesian Computation. *Ecology and Evolution. Accepted*

### MESS
MESS is a novel comparative phylogeographic model grounded in community
ecological theory. This integrative approach makes use of four data axes
(distributions of traits, abundances, genetic diversities/divergences, and
phylogenetic patterns) to enable testing alternative community assembly models
(neutral vs non-neutral) and estimating parameters underlying different
assembly processes (e.g. dispersal vs in situ speciation). This method
capitalizes on the widespread use of DNA barcoding and meta-barcoding
approaches and is implemented in the software package MESS co-developed by I.
Overcast & M. Ruffley.

* What kind of genetic data it uses: MESS requires population-level sampling (5-10
individuals per species) from a local community or multiple local communities.
This can be at a variety of scales ranging from a microbial community within a host
individual, a locally sampled plot targeting everything from a taxonomic group, to a
regional assemblage that emerged via disersal and/or local speciation. Currently only
single locus data is supported, so community metabarcoding projects would be quite
appropriate. Other data types can be included but are not required (abundances, per taxon
trait metrics, and phylogenetic information).   
* Documentation: [MESS documentation](https://pymess.readthedocs.io/en/latest/)
* Software: [MESS GitHub](https://github.com/messDiv/MESS)
* Reference: Overcast, I, Emerson, BC, Hickerson, MJ. (2019). An integrated model of population genetics and community ecology. Journal of Biogeography, 46: 816-829. [https://doi.org/10.1111/jbi.13541](https://doi.org/10.1111/jbi.13541)

### Multi-DICE
Multi-DICE is an R package for constructing hierarchical co-demographic models and simulating multi-taxa summary statistic vectors in order to perform comparative demographic inferences within a single, unified analysis. Previously, Multi-DICE simulations have been used within a supervised machine learning, specifically random forest, and approximate Bayesian computation (ABC) framework for statistical inference of temporal synchrony among multi-taxa single-population size changes. Additionally, a currently unpublished modification of Multi-DICE that deploys a co-demographic model of population-pairs to investigate congruence in co-divergence is introduced.

* What kind of data it uses: Multi-DICE is designed with genome-wide data in mind (e.g. >= 1000 independent SNPs), in which case the aggregate site frequency spectrum (aSFS) is employed to summarize multi-taxa SNP data. However, Multi-DICE is also set up to handle single-locus (e.g. mitochondrial) data, following a similar approach outlined in Chan et al. (2014) and likewise implemented in PipeMaster below. Data are collected from multiple populations, with greater power achieved from more populations (ideally at least five); taxonomic relationships are not assumed among populations (i.e. there are no restrictions on genetic distance between user-defined populations), though life history traits and demographic parameterizations should be broadly applicable across populations (e.g. mutation rate, current effective population size ought to be relatively comparable, for example an order of magnitude)
* Documentation: https://github.com/xanderxue/Multi-DICE
* Software: https://github.com/xanderxue/Multi-DICE
* Reference: Xue AT, Hickerson MJ (2017). Multi-DICE: R package for comparative population genomic inference under hierarchical co-demographic models of independent single-population size changes. Molecular ecology resources, 17(6), e212-e224.
Xue AT, Hickerson MJ (2015). The aggregate site frequency spectrum for comparative population genomic inference. Molecular ecology, 24(24), 6223-6240.
Chan YL, Schanzenbach D, Hickerson MJ (2014). Detecting concerted demographic response across community assemblages using hierarchical approximate Bayesian computation. Molecular Biology and Evolution, 31(9), 2501-2515.


### PipeMaster
PipeMaster is an R-package to build demographic models and simulate data under the coalescent model. Current implementation can simulate sanger-type and nexgen data for single species or complex of species. It is also possible to simulate single-locus data for hierarchical demographic models of comparative phylogeography and species trees with one horizontal connection (Phylogenetic Networks).
PipeMaster simulates summary statistics and coalescent trees. It calculates the same summary statistics on an empirical data. The user can use these sumary statistics to perform aproximate Bayesian computation (ABC) or supervized machine learning (SML) for model and parameter inference.

* What kind of data it uses: Sanger, UCE, Radseq, ddRad, Anchored loci for non-hierarchical models. PipeMaster does not use the SFS, but fasta alignments of the entire loci with monomorphic sites. Alignments of invariable loci should also be included in the input. Single-locus data for comparative demography.
* Documentation: [PipeMaster documentation](https://github.com/gehara/PipeMaster/blob/master/README.md)
* Software: [PipeMaster github page](https://github.com/gehara/PipeMaster)
* References: [Gehara M, Mazzochinni G, Burbrink F (*in review*) PipeMaster: inferring population divergence and demographic history with approximate Bayesian computation and supervised machine-learning in R](Oslo2019/PM_files/PipeMaster.pdf)
* Gehara, M, Garda, AA, Werneck *et al* (2017). Estimating synchronous demographic changes across populations using hABC and its application for a herpetological community from northeastern Brazil. Molecular Ecology, 26(18), 4756-4771.



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



## Acknowledgements

[PoreCamp](https://porecamp.github.io/) - Which inspired the design of this workshop and also of this site.
[RADCamp](https://radcamp.github.io/) - RAD-Seq assembly and analysis workshop resources.
ANU, University of Adelaide, UT Arlington, and UNAM for hosting previous workshops on Multi-DICE
