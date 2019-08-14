## Initializing and activating your conda environment

[Conda](https://conda.io/docs/) is a command line software installation tool
based on python. It will allow us to install and run various useful
applications inside our home directory that we would otherwise have to hassle
the HPC admins to install for us. Conda provides an isolated environment for
each user, allowing us all to manage our own independent suites of
applications, based on our own computing needs.

Run this command inside an ssh window on the cluster:
```bash
$ wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
```
> **Note:** `wget` is a command line utility for fetching content from the internet.
You use it when you want to **get** stuff from the **w**eb, so that's why it's called `wget`.

After the download finishes you can execute the conda installer using `bash`.
`bash` is the name of the terminal program that runs on the cluster, and `.sh`
files are scripts that bash knows how to run. The extra argument `-b` at the end
is specific to this `.sh` script, and tells it to automatically run the entire
script (in **b**atch mode) instead of stopping to ask us questions as it goes.

```bash
$ bash Miniconda3-latest-Linux-x86_64.sh -b
```
This will create a new directory where the `conda` program will be located,
and also where all of the software that we will eventually install with conda
will be stored. By default the new directory will be placed in your home
directory and will be called `miniconda3`.

```bash
$ ./miniconda3/bin/conda init
$ bash
$ which python
/usit/abel/u1/iovercast/miniconda3/bin/python
```

The first line here initializes our conda install, something that the `-b`
flag above does not do. Now we need to log out and log back in to start working
in the conda environment. An easy way to do this is just to run `bash` again
by hand. This will give us a new terminal where you can ask `which` python
version is preferred, and it will show you the conda version installed inside
your home directory.

**NB:** Conda has a notion of 'environments' which are isolated containers
for installing suites of programs and their dependencies. The 'base' environment
is the default and you'll see when conda is active that `(base)` is prepended
to your terminal prompt. Mine looks like this:

```bash
(base) bash-4.1$
```
<a name="install-workshop-sw"></a>  
## Install workshop software and dependencies
Turns out 95% of all the software we need for the whole workshop is included
as a dependency of MESS, so here we'll just install MESS through conda.

```bash

## Install MESS using conda
$ conda install -c conda-forge -c mess mess -y
```
  
This often takes a while (~5 minutes), and produces a bunch of pretty arcane
output. After it finishes you can test it by running MESS. If this works then
you are good to go:

```bash
$ MESS -h
```
    usage: MESS [-h] [-n new] [-p params] [-s sims] [-c cores] [-r] [-e empirical]
                [-f] [-q] [-Q] [-d] [-l] [--ipcluster [ipcluster]] [--fancy-plots]
