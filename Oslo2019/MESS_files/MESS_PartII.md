# MESS (Massive Eco-Evolutionary Synthesis Simulations) - Part II

This is the second part of the MESS tutorial in which we introduce the API mode
using jupyter notebooks. In this tutorial we'll walk through the entire simulation 
and analysis process. This is meant as a broad introduction to familiarize 
users with the general workflow, and some of the parameters and terminology. 
We will use as an example in this tutorial the __??????__ data set from
__?????__. However, you can follow along with one of the other example
data sets if you like and although your results will vary the procedure will 
be identical. 

## MESS Part II Outline
* [Crash course in machine learing](#ML-Intro)
* [Setting up and connecting to a notebook server on the cluster](#NB-Cluster-Setup)
* [Create and parameterize a new MESS Region](#Create-MESS-Region)
* [Run MESS simulations in API mode](#Simulate-MESS-API)
* [ML assembly model classification](#MESS-API-Classification)
* [ML parameter estimation](#MESS-API-Regression)
* [Free time to experiment with other example datasets](#Example-Datasets)

For the purposes of this tutorial, all command interactions will take place
inside a jupyter notebook running on the cluster. For the most part we will
be writing and executing python commands.

<a name="ML-Intro"></a>
## Crash course in machine learing
Some stuff here about intro to machine learning and random forests.
Megan will do 20-25 Minutes of this.

<a name="NB-Cluster-Setup"></a>
## Setting up and connecting to a notebook server on the cluster
Lets get set up and connected to our notebook server on the cluster again. If 
you get stuck you might review the [jupyter notebook troubleshooting page]("../Jupyter_Notebook_TLDR.html"),
or the [notebook troubleshooting quick-guide](../Jupyter_Notebook_TLDR.md)

In the juypter browser window navigate to `~/MESS` and choose "New->Notebook->Python 3"

<a name="Import-example-data"></a>
## Download and examine example data
We will be using as an example dataset of community-scale COI sequences 
(~500bp) and densely sampled abundances for the spider community on the island 
of La Reunion, an overseas department of France, which is  the largest of the 
Mascarene islands, located in the Indian Ocean approximately 1000 km from 
Madagascar. The data we will be using was collected and published by Emerson 
et al (2017). For this exercise, we will just grab and use the formatted data 
from the MESS github repository. For further instruction on properly 
formatting and converting raw data into MESS-ready format see the [MESS raw data handling page]("MESS_process_raw_data.html").

In a new cell in your notebook you can download the Reunion spider data like this:

```python
!wget https://raw.githubusercontent.com/messDiv/MESS/master/empirical_data/Reunion_spiders/spider.dat
```
**NB:** The `!` prior to the command here indicates that the jupyter notebook
should interpret this as a bash command executed at the command line. This is a
handy way of executing bash commands from within the notebook environment, rather
than returning to a terminal window on the cluster. It's just a nice shortcut.

Now make a new cell and import MESS and pandas (which is a python structured data
library providing the DataFrame class), and read in the data you just downloaded.

```python
import MESS
import pandas as pd
spider_df = pd.read_csv("spider.dat", index_col=0)
spider_df[:5]
```

**NB:** Importing pandas as `pd` is pretty cannonical. It makes typing out
pandas commands shorter because you can reference it as `pd` rather than `pandas`.
**NB::** The final line in the above command asks python to display the first 5 rows of
the `spider_df` dataframe. It should look like this:

![png](images/Reunion_spider_df.png)

<a name="Create-MESS-Region"></a>
## Create and parameterize a new MESS Region

A MESS `Region`

```python
reunion = MESS.Region("LaReunion")
print(reunion.get_params())
```
```
------- MESS params file (v.0.1.0)----------------------------------------------
wat                  ## [0] [simulation_name]: The name of this simulation scenario
./default_MESS       ## [1] [project_dir]: Where to save files
0                    ## [2] [generations]: Duration of simulations. Values/ranges Int for generations, or float [0-1] for lambda.
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
------- LocalCommunity params: Loc1---------------------------------------------
Loc1                 ## [0] [name]: Local community name
1000                 ## [1] [J]: Number of individuals in the local community
0.01                 ## [2] [m]: Migration rate into local community
0                    ## [3] [speciation_prob]: Probability of speciation per timestep in local community
```

<a name="Simulate-MESS-API"></a>
## Run MESS simulations in API mode

<a name="MESS-API-Classification"></a>
## ML assembly model classification

<a name="MESS-API-Regression"></a>
## ML parameter estimation

<a name="Example-Datasets"></a>
## Free time to experiment with other example datasets

## References

Emerson, B. C., Casquet, J., López, H., Cardoso, P., Borges, P. A., Mollaret, N., 
... & Thébaud, C. (2017). A combined field survey and molecular identification
 protocol for comparing forest arthropod biodiversity across spatial scales. 
Molecular ecology resources, 17(4), 694-707.
