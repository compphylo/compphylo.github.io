# MESS (Massive Eco-Evolutionary Synthesis Simulations) - Part I

This is the first part of the full tutorial for the command line interface 
(**CLI**) for MESS. In this tutorial we'll walk through the entire simulation 
and analysis process. This is meant as a broad introduction to familiarize 
users with the general workflow, and some of the parameters and terminology. 
We will use as an example in this tutorial the __??????__ data set from
__?????__. However, you can follow along with one of the other example
data sets if you like and although your results will vary the procedure will 
be identical. 

## MESS Part I Outline
* [Overview of MESS Simulations](#MESS-Overview)
* [Installation](#Installation)
* [TL;DR Run your first simulations](#TLDR-Simulations)
* [MESS CLI Help](#MESS-Help)
* [Create and edit a new params file](#Create-Params-File)
* [Run simulations using your edited params file](#Simulate)
* [Inspect the output of the simulation runs](#Inspect-Simulations)
* [Setting prior ranges on parameters](#Prior-Ranges)
* [Curating empirical data](#Curate-Empirical)

Each grey cell in this tutorial indicates a command line interaction. 
Lines starting with `$ ` indicate a command that should be executed 
in a terminal connected to the cluster, for example by copying and 
pasting the text into your terminal. Elements in code cells surrounded 
by angle brackets (e.g. <username>) are variables that need to be 
replaced by the user. All lines in code cells beginning with \#\# are 
comments and should not be copied and executed. All other lines should 
be interpreted as output from the issued commands.

```bash
## Example Code Cell.
## Create an empty file in my home directory called `watdo.txt`
$ touch ~/watdo.txt

## Print "wat" to the screen
$ echo "wat"
wat
```

<a name="MESS-Overview"></a>
## Overview of MESS simulation and analysis workflow

![png](images/Forward_Time_Neutral_Assembly.png)

The basic steps of this process are as follows:

* Step 1 - Set parameters
* Step 2 - Run mega simulations
* Step 3 - Use ML inference procedure
* Step 4 - ???
* Step 5 - Profit!!

<a name="Installation"></a>
## Installing MESS

<a name="TLDR-Simulations"></a>
## TL;DR Just show me how to do the simuations! 
Say you're impatient and want to skip right to the good stuff, well here you go.

```
## Create a parameters file
MESS -n new-sims
## Do 10 simulations using the default settings
MESS -p params-new-sims.txt -s 10
```

<a name="MESS-Help"></a>
## MESS Help

To better understand how to use MESS, let's take a look at the `help` argument.
We will use some of the MESS command line arguments in this tutorial (for
example: -n, -p, -s, -c). The complete list of optional arguments and
their explanation can be accessed with the `--help` flag:

```
$ MESS -h
usage: MESS [-h] [-n new] [-p params] [-s sims] [-c cores] [-r] [-e empirical]
            [-f] [-q] [-Q] [-d] [-l] [--ipcluster [ipcluster]] [--fancy-plots]

optional arguments:
  -h, --help            show this help message and exit
  -n new                create new file 'params-{new}.txt' in current
                        directory
  -p params             path to params file simulations: params-{name}.txt
  -s sims               Generate specified number of simulations
  -c cores              number of CPU cores to use (Default=0=All)
  -r                    show status of this simulation run
  -e empirical          Validate and import empirical data.
  -f                    force overwrite of existing data
  -q                    do not print to stderror or stdout.
  -Q                    do not print anything ever.
  -d                    print lots more info to mess_log.txt.
  -l                    Write out lots of information in one directory per
                        simulation.
  --ipcluster [ipcluster]
                        connect to ipcluster profile
  --fancy-plots         Construct fancy plots and animated gifs.

  * Example command-line usage:
    MESS -n data                       ## create new file called params-data.txt
    MESS -p params-data.txt            ## run MESS with settings in params file
    MESS -p params-data.txt -f         ## run MESS, overwrite existing data.
```

<a name="Create-Params-File"></a>
## Create a new parameters file
ipyrad uses a text file to hold all the parameters for a given assembly.
Start by creating a new parameters file with the `-n` flag. This flag
requires you to pass in a name for your assembly. In the example we use
`simdata` but the name can be anything at all. Once you start
analysing your own data you might call your parameters file something
more informative, like the name of your organism and some details on the settings.

```bash 
# go to our working directory
$ cd ~/work

# Create a new params file named 'simdata'
$ MESS -n simdata
```

This will create a file in the current directory called `params-simdata.txt`.
The params file lists on each line one parameter followed by a \#\# mark, then
the name of the parameter, and then a short description of its purpose. Lets
take a look at it.

``` 
$ cat params-simdata.txt
------- MESS params file (v.0.0.99)---------------------------------------------
simdata              ## [0] [simulation_name]: The name of this simulation scenario
./default_MESS       ## [1] [project_dir]: Where to save files
0                    ## [2] [generations]: Duration of simulations. Specify int range or 0 for lambda.
neutral              ## [3] [community_assembly_model]: Model of Community Assembly: neutral, filtering, competition
point_mutation       ## [4] [speciation_model]: Type of speciation process: none, point_mutation, protracted, random_fission
2.2e-08              ## [5] [mutation_rate]: Mutation rate scaled per base per generation
2000                 ## [6] [alpha]: Abundance/Ne scaling factor
570                  ## [7] [sequence_length]: Length in bases of the sequence to simulate
------- Metacommunity params: --------------------------------------------------
100                  ## [0] [S_m]: Number of species in the regional pool
750000               ## [1] [J_m]: Total # of individuals in the regional pool
2                    ## [2] [speciation_rate]: Speciation rate of metacommunity
0.7                  ## [3] [death_proportion]: Proportion of speciation rate to be extinction rate
2                    ## [4] [trait_rate_meta]: Trait evolution rate parameter for metacommunity
1                    ## [5] [ecological_strength]: Strength of community assembly process on phenotypic change
------- LocalCommunity params: island1------------------------------------------
island1              ## [0] [name]: Local community name
1000                 ## [1] [J]: Number of individuals in the local community
0.01                 ## [2] [m]: Migration rate into local community
0                    ## [3] [speciation_prob]: Probability of speciation per timestep in local community
```

> **Note:** What's the difference between a CLI argument and a MESS params file
parameter, you may be asking yourself? Well, MESS CLI arguments specify how
the simulations are performed (e.g. how many to run, how many cores to use,
whether to print debugging information, etc), whereas MESS params file
parameters dictate the structure of the simulations to run (e.g. sizes of
communities, migration rates, specation rates, etc).

The defaults are all values of moderate size that will generate 'normal'
looking simulations, and we won't ***mess*** with them for now, but lets just
change a couple parameters to get the hang of it. Why don't we change
the `name` parameter of the local community, "island1" is so generic!. Pick
your favorite island and change the name to this. Let's also set `J` (size
of the local community in individuals) equal to 500 as this will speed up
the simulations (smaller local communities reach equilibrium faster).

We will use the `nano` text editor to modify `params-simdata.txt` and change
this parameter:

```bash
$ nano params-simdata.txt
```

Nano is a command line editor, so you'll need to use only the arrow keys
on the keyboard for navigating around the file. Nano accepts a few special
keyboard commands for doing things other than modifying text, and it lists
these on the bottom of the frame. After you are done making the changes
your file will now have lines that look like this:

```bash
La_Reunion ## [0] [name]: Local community name
500                 ## [1] [J]: Number of individuals in the local community
```

> **Note:** For scientific computing, in almost all cases spaces in variable
names and labels should be considered **harmful**. Notice here how I replace
the space in "La Reunion" with an underscore ("\_") character, this is common
practice that you should adopt.

After you change this parameters you may save and exit nano by typing CTRL+o
(to write **O**utput), and then CTRL+x (to e**X**it the program).

> **Note:** The `CTRL+x` notation indicates that you should hold down the control
key (which is often styled 'ctrl' on the keyboard) and then push 'x'.

Once we start running the simulations and performing analyses MESS all the temp
files and directories it needs are created in the `project_dir` directory and
use the prefix specified by the `simulation_name` parameter. Because we use the
default (`./default_MESS`) for the `project_dir` for this tutorial, all these
intermediate directories will be of the form: `~/work/default_MESS/simdata_*`,
or the analagous name that you used for your assembly name.

> **Note on files in the project directory:** MESS relies on the integrity
of the `project_directory` for keeping track of various temporary files
used by the simulation/analysis process. One result of this is that you can
have multiple simulations of the same community assembly scenario using
different parameter settings and you don't have to manage all the files
yourself! Another result is that **you should not rename or move any of the
files or directories inside your project directory**, unless you know what
you're doing or you don't mind if your simulations/analyses break.


<a name="Simulate"></a>
## Run simulations using your edited params file

> **Special Note:** In command line mode please be aware to *always* specify
the number of cores with the `-c` flag. If you do not specify the number of 
cores MESS assumes you want only one of them, which will result in painfully
slow simulation runs (serial processing).

```bash
## -p    the params file we wish to use
## -s    the number of simulations to perform
## -c    the number of cores to allocate   <-- Important!
$ MESS -p params-simdata.txt -s 10 -c 4
 -------------------------------------------------------------
  MESS [v.0.0.99]
  Massive Eco-Evolutionary Synthesis Simulations
 -------------------------------------------------------------
  Project directory exists. Additional simulations will be appended.

    <MESS.Region simdata: ['La_Reunion']>
  establishing parallel connection:
  host compute node: [4 cores] on goatzilla
    Generating 10 simulation(s).
  [####################] 100%  Performing Simulations    | 0:00:46 | 
  [####################] 100% 
    Finished 10 simulations
 Clean up ipcluster <ipyparallel.client.client.Client object at 0x7f15cc3c9090>
```

> **Note:** You can see here that MESS is intelligently handling all the
parallelization work for you. You tell it how many cores to use with the `c`
flag and it portions out simulations among all the cores as they become
available.

<a name="Inspect-Simulations"></a>
## Inspect the output of the simulation runs

<a name="Parameter-Ranges"></a>
## Setting prior ranges on parameters

<a name="Curate-Empirical"></a>
## Curating empirical data

#############################


> **Note:** Again, the `./` notation indicates the current working directory.
You can always view the current working directory with the `pwd` command
(**p**rint **w**orking **d**irectory).


# Input data format

Before we get started let's take a look at what the raw data looks like.

# Step 1: Demultiplexing the raw data

Commonly, sequencing facilities will give you one giant .gz file that contains all the reads from all the samples all mixed up together. Step 1 is all about sorting out which reads belong to which samples, so this is where the barcodes file comes in handy. The barcodes file is a simple text file mapping sample names to barcode sequences. Lets look at the simulated barcodes:


## In-depth operations of running an ipyrad step
Any time ipyrad is invoked it performs a few housekeeping operations: 
1. Load the assembly object - Since this is our first time running any steps we need to initialize our assembly.
2. Start the parallel cluster - ipyrad uses a parallelization library called `ipyparallel`. Every time we start a step we fire up the parallel clients. This makes your assemblies go **smokin'** fast.
3. Do the work - Actually perform the work of the requested step(s) (in this case demux'ing in sample reads).
4. Save, clean up, and exit - Save the state of the assembly and spin down the ipyparallel cluster.

As a convenience ipyrad internally tracks the state of all your steps in your 
current assembly, so at any time you can ask for results by invoking the `-r` flag.
We also use the `-p` flag to tell it which params file (i.e., which assembly) we 
want to print stats for.

```bash
## -r fetches informative results from currently executed steps  
$ ipyrad -p params-simdata.txt -r
```

lets imagine this is true of the simulated data, and we'll try to account
for this by trimming reads to 90bp and using aggressive adapter filtering. 

Edit your params file again with `nano`:

```bash
nano params-simdata.txt
```

and change the following two parameter settings:

```
2                               ## [16] [filter_adapters]: Filter for adapters/primers (1 or 2=stricter)
0, 90, 0, 0                     ## [25] [trim_reads]: Trim raw read edges (R1>, <R1, R2>, <R2) (see docs)
```
> **Note:** Saving and quitting from `nano`: `CTRL+o` then `CTRL+x`

```bash
$ ipyrad -p params-simdata.txt -s 2 -c 4
```
```
 -------------------------------------------------------------
  ipyrad [v.0.7.28]
  Interactive assembly and analysis of RAD-seq data
 -------------------------------------------------------------
  loading Assembly: simdata
  from saved path: ~/work/simdata.json
  establishing parallel connection:
  host compute node: [4 cores] on darwin

  Step 2: Filtering reads 
  [####################] 100%  processing reads      | 0:00:12
```

The filtered files are written to a new directory called `simdata_edits`. Again, 
you can look at the results output by this step and also some handy stats tracked 
for this assembly.

```bash
## View the output of step 2
$ cat simdata_edits/s2_rawedit_stats.txt 
      reads_raw  trim_adapter_bp_read1  trim_quality_bp_read1  reads_filtered_by_Ns  reads_filtered_by_minlen  reads_passed_filter
1A_0      19862                    360                      0                     0                         0  19862
1B_0      20043                    362                      0                     0                         0  20043
1C_0      20136                    349                      0                     0                         0  20136
1D_0      19966                    404                      0                     0                         0  19966
2E_0      20017                    394                      0                     0                         0  20017
2F_0      19933                    376                      0                     0                         0  19933
2G_0      20030                    381                      0                     0                         0  20030
2H_0      20199                    386                      0                     0                         1  20198
3I_0      19885                    372                      0                     0                         0  19885
3J_0      19822                    381                      0                     0                         0  19822
3K_0      19965                    382                      0                     0                         0  19965
3L_0      20008                    424                      0                     0                         0  20008
```
It's a little boring, the reads are **too clean**. Here is an example of something 
like you'd see from real data (this is the Anolis dataset). Notice the `reads_passed_filter`
value. This dataset is decent, as you can see we're losing < 10% of the reads per sample,
mostly due to the minimum length cutoff.
```
                   reads_raw  trim_adapter_bp_read1  trim_quality_bp_read1  reads_filtered_by_Ns  reads_filtered_by_minlen  reads_passed_filter
punc_IBSPCRIB0361     250000                 108761                 160210                    66                     12415               237519
punc_ICST764          250000                 107320                 178463                    68                     13117               236815
punc_JFT773           250000                 110684                 190803                    46                      9852               240102
punc_MTR05978         250000                 102932                 144773                    54                     12242               237704
punc_MTR17744         250000                 103394                 211363                    55                      9549               240396
punc_MTR21545         250000                 119191                 161709                    63                     21972               227965
punc_MTR34414         250000                 109207                 193401                    54                     16372               233574
punc_MTRX1468         250000                 119746                 134069                    45                     19052               230903
punc_MTRX1478         250000                 116009                 184189                    53                     16549               233398
punc_MUFAL9635        250000                 114492                 182877                    61                     18071               231868
```

```bash
## Get current stats including # raw reads and # reads after filtering.
$ ipyrad -p params-simdata.txt -r
```

You might also take a closer look at the filtered reads: 

```bash
$ zcat simdata_edits/1A_0.trimmed_R1_.fastq.gz | head -n 12
```
```
@lane1_locus0_1A_0_0 1:N:0:
TGCAGTTTAACTGTTCAAGTTGGCAAGATCAAGTCGTCCCTAGCCCCCGCGTCCGTTTTTACCTGGTCGCGGTCCCGACCCAGCTGCCCC
+
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
@lane1_locus0_1A_0_1 1:N:0:
TGCAGTTTAACTGTTCAAGTTGGCAAGATCAAGTCGTCCCTAGCCCCCGCGTCCGTTTTTACCTGGTCGCGGTCCCGACCCAGCTGCCCC
+
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
@lane1_locus0_1A_0_2 1:N:0:
TGCAGTTTAACTGTTCAAGTTGGCAAGATCAAGTCGTCCCTAGCCCCCGCGTCCGTTTTTACCTGGTCGCGGTCCCGACCCAGCTGCCCC
+
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
```

Since the adapter content of the simulated data is effectively 0, the net effect
of step 2 is that the reads have been trimmed to 90bp. This isn't necessary here,
but it provides a good example since real data typically will need trimming. 

# Step 3: clustering within-samples

Step 3 de-replicates and then clusters reads within each sample by the
set clustering threshold and then writes the clusters to new files in a
directory called `simdata_clust_0.85`. Intuitively we are trying to
identify all the reads that map to the same locus within each sample.
The clustering threshold specifies the minimum percentage of sequence
similarity below which we will consider two reads to have come from
different loci.

The true name of this output directory will be dictated by the value you
set for the `clust_threshold` parameter in the params file. This makes it
very easy to test different clustering thresholds, and keep the different
runs organized (since you will have for example `simdata_clust_0.85` and
`simdata_clust_0.9`).

You can see the default value is 0.85, so our default directory is named
accordingly. This value dictates the percentage of sequence similarity
that reads must have in order to be considered reads at the same locus.
You'll more than likely want to experiment with this value, but 0.85 is
a reliable default, balancing over-splitting of loci vs over-lumping.
Don't mess with this until you feel comfortable with the overall
workflow, and also until you've learned about
[Branching assemblies](https://ipyrad.readthedocs.io/tutorial_advanced_cli.html)
(which we will get to later this afternoon).

There have been many papers written comparing how results of assemblies vary 
depending on the clustering threshold. In general, my advice is to use a value
between about .82 and .95. Within this region results typically do not vary too
significantly, whereas above .95 you will oversplit loci and recover fewer SNPs.

It's also possible to incorporate information from a reference
genome to improve clustering at this step, if such a resources is
available for your organism (or one that is relatively closely related).
We will not cover reference based assemblies in this workshop, but you 
can refer to the [ipyrad documentation](https://ipyrad.readthedocs.io/tutorial_advanced_cli.html)
for more information.

> **Note on performance:** Steps 3 and 6 generally take considerably 
longer than any of the other steps, due to the resource intensive clustering 
and alignment phases. These can take on the order of 10-100x as long 
as the next longest running step. This depends heavily on the number of samples
in your dataset, the number of cores on your computer, the length(s) of your reads, and the 
"messiness" of your data in terms of the number of unique loci present (this can
vary from a few thousand to many millions).

Now lets run step 3:

```bash
$ ipyrad -p params-simdata.txt -s 3 -c 4
```
```
 -------------------------------------------------------------
  ipyrad [v.0.7.28]
  Interactive assembly and analysis of RAD-seq data
 -------------------------------------------------------------
  loading Assembly: simdata
  from saved path: ~/work/simdata.json
  establishing parallel connection:
  host compute node: [4 cores] on e305ff77a529

  Step 3: Clustering/Mapping reads within samples
  [####################] 100% 0:00:01 | concatenating
  [####################] 100% 0:00:01 | dereplicating
  [####################] 100% 0:00:00 | clustering/mapping
  [####################] 100% 0:00:00 | building clusters
  [####################] 100% 0:00:00 | chunking clusters
  [####################] 100% 0:00:03 | aligning clusters
  [####################] 100% 0:00:00 | concat clusters
  [####################] 100% 0:00:00 | calc cluster stats
```

In-depth operations of step 3:
* concatenating - Concatenate files from merged assemblies
* dereplicating - Merge all identical reads
* clustering - Find reads matching by sequence similarity threshold
* building clusters - Group similar reads into clusters
* chunking - Subsample cluster files to improve performance of alignment step
* aligning - Align all clusters
* concatenating - Gather chunked clusters into one full file of aligned clusters
* calc cluster stats - Just as it says!

Again we can examine the results. The stats output tells you how many
clusters were found ('clusters_total'), and the number of clusters that pass the mindepth
thresholds ('clusters_hidepth'). We go into more detail about mindepth settings in some of
the [advanced tutorials](https://ipyrad.readthedocs.io/userguide.html#tutorials-running-ipyrad)
but for now all you need to know is that by default step 3 will filter out clusters that 
only have a handful of reads on the assumption that it will be difficult to accurately call
bases at such low depth.

```bash
$ ipyrad -p params-simdata.txt -r
```
```
Summary stats of Assembly simdata
------------------------------------------------
      state  reads_raw  reads_passed_filter  clusters_total  clusters_hidepth
1A_0      3      19862                19862            1000              1000
1B_0      3      20043                20043            1000              1000
1C_0      3      20136                20136            1000              1000
1D_0      3      19966                19966            1000              1000
2E_0      3      20017                20017            1000              1000
2F_0      3      19933                19933            1000              1000
2G_0      3      20030                20030            1000              1000
2H_0      3      20199                20198            1000              1000
3I_0      3      19885                19885            1000              1000
3J_0      3      19822                19822            1000              1000
3K_0      3      19965                19965            1000              1000
3L_0      3      20008                20008            1000              1000


Full stats files
------------------------------------------------
step 1: ./simdata_fastqs/s1_demultiplex_stats.txt
step 2: ./simdata_edits/s2_rawedit_stats.txt
step 3: ./simdata_clust_0.85/s3_cluster_stats.txt
```

Again, the final output of step 3 is dereplicated, clustered files for
each sample in `./simdata_0.85/`. You can get a feel for what
this looks like by examining a portion of one of the files. 

```bash
## Same as above, `zcat` unzips and prints to the screen and 
## `head -n 24` means just show me the first 24 lines. 
$  zcat simdata_clust_0.85/1A_0.clustS.gz | head -n 24
```
```
009149cc23d2367f21b67ac0060d9f2f;size=18;*
TGCAGATAAATCAAACTGCAGCTTGATATGGGCTTCGACCCAGTGGTGGTAGCCTCTCTCTCCCAGTATAACCTCGACCCCAAAATCGCA
d498af3d4575b871de6d5a7f239279ea;size=1;+
TGCAGATAAATCAAACTGCAGCTTGATATGGGCTTCGACCCAGTGGTGGTAGCCTCTCTCTCCCAGTATAACCTCGACCCCAAAATCGCT
b71555537ed7f88329fda094cc6cef8a;size=1;+
TGCAGATAAATCAAACTGCAGCTTGATATGGGCTTCGACCCAGTGGTGGTAGCGTCTCTCTCCCAGTATAACCTCGACCCCAAAATCGCA
//
//
00f1daaa8dd241bd72db91aa62b31bb4;size=8;*
TGCAGGGGTTAGGCGTATCTGCCAAAGATTCTTCGATCGTGATGATTCTAGACGACAATACACCTGATGCTTCTCGCATGCATAGCAATG
6780649efadfc8c182cfd2af7071316b;size=8;+
TGCAGGGGTTAGGCGTATCTGCCAAAGATTCTTCGATCGTGATGATTCTAGAGGACAATACACCTGATGCTTCTCGCATGCATAGCAATG
23a7b43b7f5008017574400c460982dc;size=1;+
TGCAGGGGTTAGGCGTATCTTCCAAAGATTCTTCGATCGTGATGATTCTAGACGACAATACACCTGATGCTTCTCGCATGCATAGCAATG
e6830f9099df558397f0fd28bf9568b6;size=1;+
TGCAGGGGTTAGGCGTATCTGCCAAAGATTCTTCGATCGTGATGATTCTAGACGATAATACACCTGATGCTTCTCGCATGCATAGCAATG
//
//
013b4e939c785d94369ea933f7f98f0c;size=18;*
TGCAGATACTTCGCCCGGTTCTCCATACCCCATTCTTTGCTGCTTCTTCTGAGCGCACTCGACCTATGCCTAGTCGCACCTCGCATATTT
a7e612c565f1d70f054864759b58205f;size=1;+
TGCAGATACTTCGCCCGGTTCTCCATACCCCATTCTTTGCTGCTTCTTCTGAGCGCACTCGACCTATGCCTAGTCCCACCTCGCATATTT
//
//
```

Reads that are sufficiently similar (based on the above sequence
similarity threshold) are grouped together in clusters separated by
"//". For the second cluster above this is *probably* heterozygous 
with some sequencing error, and the first and third clusters are 
probably homozygous. Again, the simulated data is too clean to get a
real picture of how tricky real data can be. Looking again at the Anolis
data:
```
000e3bb624e3bd7e91b47238b7314dc6;size=4;*
TGCATATCACAAGAGAAGAAAGCCACTAATTAAGGGGAAAAGAAAAGCCTCTGATATAGCTCCGATATATCATGC-
75e462e101383cca3db0c02fca80b37a;size=2;-
-GCATATCACAAGAGAAGAAAGCCACTAATTAAGGGGAAAAGAAAAGCCTCTGATATAGCTCCGATATATCATGCA
//
//
001236a2310c39a3a16d96c4c6c48df1;size=4;*
TGCATCTCTTTGGGCTGTTGCTTGGTGGCACACCATGCTGCTTTCTCCTCACTTTTTCTCTCTTTTCCTGAGACT------------------------------
4644056dca0546a270ba897b018624b4;size=2;-
------------------------------CACCATGCTGCTTTCTCCTCACTTTTTCTCTCTTTTCCTGAGACTGAGCCAGGGACAGCGGCTGAGGAGGATGCA
5412b772ec0429af178caf6040d2af30;size=1;+
TGCATTTCTTTGGGCTGTTGCTTGGTGGCACACCATGCTGCTTTCTCCTCACTTTTTCTCTCTTTTCCTGAGACT------------------------------
//
//
```

Are there truly two alleles (heterozygote) for each of these loci? Are they homozygous 
with lots of sequencing errors, or a heterozygote with few reads for one of the alleles?

Thankfully, untangling this mess is what step 4 is all about.
