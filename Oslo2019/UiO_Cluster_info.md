# Cluster Basics and Housekeeping
The first activity this morning involves getting logged into and oriented on the 
cluster and getting programs and resources set up for the actual workshop. We 
make no assumptions about prior experience with cluster environments, so we 
scaffold the entire participant workshop experience from first principles. More 
advanced users hopefully will find value in some of the finer details we present.

* [Connecting to the cluster](#ssh-intro): [Windows](#ssh-for-windows)/[Mac/Linux](#ssh-for-mac)
* [Basic command line navigation](#command-line-basics)
* [Setting up the computing environment](#conda-install)
* [Writing and executing an example job submission script](#example-job-script)

## Tutorial documentation conventions
Each grey cell in this tutorial indicates a command line interaction. Lines starting with $ indicate a command that should be executed in a terminal, for example by copying and pasting the text into your terminal. All lines in code cells beginning with ## are comments and should not be copied and executed. Elements in code cells surrounded by angle brackets (e.g. `<username>`) are variables that need to be replaced by the user. All other lines should be interpreted as output from the issued commands.

```bash
## Example Code Cell.
## Create an empty file in my home directory called `watdo.txt`
$ touch ~/watdo.txt

## Print "wat" to the screen
$ echo "wat"
wat
```

## UiO High Performance Computing System (Abel)
Computational resources for the duration of this workshop have been generously
provided by the The Norwegian Research Council (Uninett Sigma2, via the Notur
project) and the University of Oslo (Depts. of Astrophysics, Chemistry,
Biology, CMBN, CEES and others). The HPC we will be using is located at:
```
abel.uio.no
```
* [Abel queueing system](https://www.uio.no/english/services/it/research/hpc/abel/help/user-guide/queue-system.html)
* [Abel FAQ](https://www.uio.no/english/services/it/research/hpc/abel/help/faq/)

**[RADCamp NYC 2018 Participant Username/Port# List](https://github.com/radcamp/radcamp.github.io/blob/master/NYC2018/participants.txt)**

<a name="ssh-intro"></a>
## SSH and the command line
Unlike laptop or desktop computers, cluster systems typically (almost exclusively) 
do not have graphical user input interfaces. Interacting with an HPC system 
therefore requires use of the command line to establish a connection, and for 
running programs and submitting jobs remotely on the cluster. To interact with 
the cluster through a terminal we use a program called SSH (secure shell) to 
create a fast and secure connection. 

<a name="ssh-for-windows"></a>
### SSH for windows
Windows computers need to use a 3rd party app for connecting to remote computers. The best app for this in my experience is [puTTY](https://www.putty.org/), a free SSH client. Right click and "Save link as" on the [64-bit binary executable link](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe) if you are using a PC.

After installing puTTY, open it and you will see a box where you can enter the "Host Name (or IP Address)" of the computer you want to connect to (the 'host'). To connect to the Habanero cluster, enter: `habanero.rcs.columbia.edu`. The default "Connection Type" should be "SSH", and the default "Port" should be "22". It's good to verify these values. Leave everything else as defualt and click "Open".

![png](01_cluster_basics_files/01_puTTY.png)

<a name="ssh-for-mac"></a>
### SSH for mac/linux
Linux operating systems come preinstalled with an ssh command line client, which we will assume linux users are aware of how to use. Mac computers are built on top of a linux-like operating system so they too ship with an SSH client, which can be accessed through the Terminal app. In a Finder window open Applications->Utilities->Terminal, then you can start an ssh session like this:

```bash
# enter your username here
$ ssh <username>@habanero.rcs.columbia.edu

# this is an example for the username "work2"
$ ssh work2@habanero.rcs.columbia.edu
```

> **Note on usage:** In command line commands we'll use the convention of wrapping variable names in angle-brackets. For example, in the command above you should substitute your own username for `<username>`. We will provide usernames and passwords on the day of the workshop. 

## Command line interface (CLI) basics
The CLI provides a way to navigate a file system, move files around, and run commands all inside a little black window. The down side of CLI is that you have to learn many at first seemingly esoteric commands for doing all the things you would normally do with a mouse. However, there are several advantages of CLI: 1) you can use it on servers that don't have a GUI interface (such as HPC clusters); 2) it's scriptable, so you can write programs to execute common tasks or run analyses and others can easily reproduce these tasks exactly; 3) it's often faster and more efficient than click-and-drag GUI interfaces. For now we will start with 4 of the most common and useful commands:

```bash
$ pwd
/home/work1
```
`pwd` stands for **"print working directory"**, which literally means "where am I now in this filesystem?". This is a question you should always be aware of when working in a terminal. Just like when you open a file browser window, when you open a new terminal you are located somewhere; the terminal will usually start you out in your "home" directory. Ok, now we know where we are, lets take a look at what's in this directory:

```bash
$ ls
```

`ls` stands for **"list"** and in our home directory there is **not much, it appears!** In fact right now there is nothing. This is okay, because you just got a brand new account, so you won't expect to have anything there. Throughout the workshop we will be adding files and directories and by the time we're done, not only will you have a bunch of experience with RAD-Seq analysis, but you'll also have a ***ton*** of stuff in your home directory. We can start out by adding the first directory for this workshop:

```bash
$ mkdir ipyrad-workshop
```

`mkdir` stands for **"make directory"**, and unlike the other two commands, this command takes one "argument". This argument is the name of the directory you wish to create, so here we direct mkdir to create a new directory called "ipyrad-workshop". Now you can use `ls` again, to look at the contents of your home directory and you should see this new directory now:

```bash
$ ls
ipyrad-workshop
```

Throughout the workshop we will be introducing new commands as the need for them arises. We will pay special attention to highlighting and explaining new commands and giving examples to practice with. 

> **Special Note:** Notice that the above directory we are making is not called `ipyrad workshop`. This is **very important**, as spaces in directory names are known to cause havoc on HPC systems. All linux based operating systems do not recognize file or directory names that include spaces because spaces act as default delimiters between arguments to commands. There are ways around this (for example Mac OS has half-baked "spaces in file names" support) but it will be so much for the better to get in the habit now of ***never including spaces in file or directory names***.

<a name="conda-install"></a>
## Download and Install conda

[Conda](https://conda.io/docs/) is a command line software installation tool 
based on python. It will allow us to install and run various useful 
applications inside our home directory that we would otherwise have to hassle 
the HPC admins to install for us. Conda provides an isolated environment for 
each user, allowing us all to manage our own independent suites of 
applications, based on our own computing needs.

Run this command inside an ssh window on the cluster:
```bash
$ wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
```
> **Note:** `wget` is a command line utility for fetching content from the internet. 
You use it when you want to **get** stuff from the **w**eb, so that's why it's called `wget`.

After the download finishes you can execute the conda installer using `bash`. 
`bash` is the name of the terminal program that runs on the cluster, and `.sh` 
files are scripts that bash knows how to run. The extra argument `-b` at the end 
is specific to this `.sh` script, and tells it to automatically run the entire 
script (in **b**atch mode) instead of stopping to ask us questions as it goes. 

```bash
$ bash Miniconda2-latest-Linux-x86_64.sh -b
```

This will create a new directory where the `conda` program will be located, 
and also where all of the software that we will eventually install with conda 
will be stored. By default the new directory will be placed in your home 
directory and will be called `miniconda2`.

```bash
$ ./miniconda2/bin/conda init
$ bash
$ which python
/usit/abel/u1/iovercast/miniconda2/bin/python
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

<a name="example-job-script"></a>
## Example Job Submission Script

Very detailed [job script documentation on the UiO Abel site](https://www.uio.no/english/services/it/research/hpc/abel/help/user-guide/job-scripts.html)

Open a new file called `myfirst.job` and add the following text:
```
#SBATCH --account=nn9458k
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=1G
```

**NB:** The `account`, `time`, and `mem-per-cpu` parameters are compulsory,
your job will not run if any of them are not specified.

Submit this job to the cluster with `sbatch` (abel uses the SLURM queue management system):

```
sbatch myfirst.job
```

And now monitor the progress of the job with qstat:

```
squeue
```

