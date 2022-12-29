# Phylogeographic Temporal Analysis (PTA)
## Simulating community-scale co-demographic histories

> ### **Questions:**
>
> - How do I run PTA simulations?
> - What parameters can I cange and how do I change them?
> - What do the simulations results look like?
> 
> ### **Learning objectives:**
>
> - Run PTA simulations in the cloud.
> - Create, view, and edit the PTA parameters file.
> - Understand key model parameters.
> - Place prior ranges on model parameters.
> - View and interpret simulation outputs.

## Table of Contents
* [Launch PTA](<#launch-pta-in-the-cloud>)
* [Create and edit a new params file](<#create-and-edit-a-new-params-file>)
* [Running PTA simulations](<#running-pta-simulations>)
* [Inspecting simulation results](<#inspecting-simulation-results>)

### Launch PTA in the cloud
For the purpose of this workshop we are running PTA using **Binder**,
which allows for running github repositories in a free, small
and isolated cloud compute instance. This allows us to side-step the (boring)
installation process and operate in a homogeneous computing environment.  
**Click the link below to launch PTA in a new tab.**

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/isaacovercast/PTA/master)

> #### **NOTE:** Binder instances are *ephemeral*!
> The down-side of Binder is that the virtual machines they provide are
> _ephemeral_, meaning that if you leave it sitting long enough or if you
> close your tab, everything you have done will be lost. For the purpose of
> a workshop this is totally fine because we'll be using toy data and all
> the steps to reproduce your work will be documented on this page. **For the
> purpose of real work you will not want to use Binder** (small amount of
> resources and inability to save your work), so at the end of the workshop
> we will provide instructions on how to install PTA and perform analysis
> on your own computer or HPC system.
>
> That all being said, Binder is still really cool and useful. ;)

After Binder launches you'll be presented with the JupyterLab interface,
which consists of a 'file browser' and an 'app launcher'.
![JupyterLab Overview](img/JupyterLab-Overview.png)

Start by launching a **Terminal** app, which will bring up a command line
interface (CLI). Type `PTA` and push enter and you'll see the PTA "Help" message:

![PTA Help](img/PTA-Help.png)

This will show several optional arguments for running PTA, and at the bottom
it gives the simplest command-line usage, which involves two steps:
* Creating a 'params' file
* Running simulations

So, lets start by creating a params file!

### Create and edit a new params file

All PTA simulations are controlled by a 'params' file which contains all the
settings relevant to the _biological_ processes. The logic of differentiating
between parameters in the params file and CLI arguments is to separate the details
that are relevant to the _biology_ (params) from the details that are relevant
to the _execution of the simulations_ (CLI arguments). You can share a params file
with somebody else and they can run simulations on their own computer using
CLI arguments that are relevant to the resources available to them (e.g. number of
CPU cores) and the simulations they generate will be _comparable_ to those you
have generated on your own computer. The params file encapsulates all the
biologically relevant details of the simulations. Let's make one now by running PTA
with the `-n` flag and specifying a name for our params file (required).

![PTA Create New Params File](img/PTA-NewParamsFile.png)

> #### **NOTE: On the importance of naming files:**
> Here we will use Arianna's Malagasy snake system as inspiration, so we call
> our params file `MG-Snakes`. In your own work you should use names for your
> params files that are meaningful for your system. Also, as usual, **spaces are
> forbidden in params files names**.

You can see the newly created file pops up in the file browser on the left side.
Double-clicking on the new `params-MG-Snakes.txt` will pop open this file in a
simple text editor interface.

![PTA Edit Params File](img/PTA-EditingParamsFile.png)

You can see there are (currently) 12 model parameters which describe various
aspects of the demographic model and the size and shape of the data to simulate.
It can seem a little daunting at first, but we don't have to understand these
all right now, so lets just focus on `npops`, the number of 'populations' to
simulate for our co-demographic analysis. By 'populations' here what we mean to
indicate are the number of independent lineages in the analysis, not specifically
'populations' _per se_. The number of `npops` could represent species or
subspecies or true populations, the taxonomic level isn't so important as their
independence as demographic units within the analysis.

#### Parameters that determine the shape and size of the data
Now let's edit this file to more closely resemble the Ariann's Malagasy snake
data. In the text window change the following values:
```
21                  ## [2] [npops]: Number of populations undergoing co-demographic processes
150                 ## [8] [length]: Length in bp of each independent genomic region to simulate
0                   ## [11] [recoms_per_gen]: Recombination rate within independent regions scaled per base per generation

```

#### Parameters that determine the demographic histories to explore

> #### **NOTE:** The meaning of key model parameters
> **Ne** - 
> **τ** - Time of demographic change
> **ε** - magnitude of change

### Running PTA simulations

### Inspecting simulation results



