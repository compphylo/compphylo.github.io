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

<a name="ML-Intro"></a>
## Crash course in machine learing
Some stuff here about intro to machine learning and random forests.
Megan will do 20-25 Minutes of this.

<a name="NB-Cluster-Setup"></a>
## Setting up and connecting to a notebook server on the cluster
Lets get set up and connected to our notebook server on the cluster again. If 
you get stuck might review the [jupyter notebook troubleshooting page]("../Jupyter_Notebook_TLDR.html").

<a name="Import-example-data"></a>
## Download and examine example data
We will be using as an example dataset COI sequences (~500bp) and densely sampled
abundances for the spider community on La Reunion. This data is from Emerson
et al (2017). For this exercise, we will just grab and use the formatted data 
from the MESS github repository. For further instruction on properly formatting
and converting raw data into MESS-ready format see the [MESS raw data handling page]("MESS_process_raw_data.html").

<a name="Create-MESS-Region"></a>
## Create and parameterize a new MESS Region

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
