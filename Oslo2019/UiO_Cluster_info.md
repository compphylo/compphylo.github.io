# Cluster Basics and Housekeeping
The first activity this morning involves getting logged into and oriented on the 
cluster and getting programs and resources set up for the actual workshop. We 
make no assumptions about prior experience with cluster environments, so we 
scaffold the entire participant workshop experience from first principles. More 
advanced users hopefully will find value in some of the finer details we present.

* [Connecting to the cluster](#ssh-intro): [Windows](#ssh-for-windows)/[Mac/Linux](#ssh-for-mac)
* [Basic command line navigation](#command-line-basics)
* [Setting up the computing environment](#conda-install)
* [Installing software for the workshop](#install-workshop-sw)
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

**[CompPhylo Participant Username/Port# List](https://github.com/compphylo/compphylo.github.io/blob/master/Oslo2019/participants.txt)**

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
Windows computers need to use a 3rd party app for connecting to remote computers. 
The best app for this in my experience is [puTTY](https://www.putty.org/), a 
free SSH client. Right click and "Save link as" on the 
[64-bit binary executable link](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe) if you are using a PC.

After installing puTTY, open it and you will see a box where you can enter the 
"Host Name (or IP Address)" of the computer you want to connect to (the 'host'). 
To connect to the Abel cluster, enter: `abel.uio.no`. The default "Connection 
Type" should be "SSH", and the default "Port" should be "22". It's good to 
verify these values. Leave everything else as defualt and click "Open".

![png](01_cluster_basics_files/01_puTTY.png)

<a name="ssh-for-mac"></a>
### SSH for mac/linux
Linux operating systems come preinstalled with an ssh command line client, 
which we will assume linux users are aware of how to use. Mac computers 
are built on top of a linux-like operating system so they too ship with an SSH 
client, which can be accessed through the Terminal app. In a Finder window open 
Applications->Utilities->Terminal, then you can start an ssh session like this:

```bash
# enter your username here
$ ssh <username>@abel.uio.no

# this is an example for the username iovercast
$ ssh iovercast@abel.uio.no
```

> **Note on usage:** In command line commands we'll use the convention of wrapping variable names in angle-brackets. For example, in the command above you should substitute your own username for `<username>`. We will provide usernames and passwords on the day of the workshop. 

## Command line interface (CLI) basics
The CLI provides a way to navigate a file system, move files around, and run commands all inside a little black window. The down side of CLI is that you have to learn many at first seemingly esoteric commands for doing all the things you would normally do with a mouse. However, there are several advantages of CLI: 1) you can use it on servers that don't have a GUI interface (such as HPC clusters); 2) it's scriptable, so you can write programs to execute common tasks or run analyses and others can easily reproduce these tasks exactly; 3) it's often faster and more efficient than click-and-drag GUI interfaces. For now we will start with 4 of the most common and useful commands:

```bash
$ pwd
/usit/abel/u1/iovercast
```
`pwd` stands for **"print working directory"**, which literally means "where am I now in this filesystem?". This is a question you should always be aware of when working in a terminal. Just like when you open a file browser window, when you open a new terminal you are located somewhere; the terminal will usually start you out in your "home" directory. Ok, now we know where we are, lets take a look at what's in this directory:

```bash
$ ls
00_README_Abel   nobackup
```

`ls` stands for **"list"** and in our home directory there are two things by default,
a README file that explains some useful stuff about the system, and an empty directory
called nobackup. Throughout the workshop we will be adding files and directories and 
by the time we're done, not only will you have a bunch of experience with analysis, 
computational comparative phylogeographic methods, but you'll also have a ***ton*** 
of stuff in your home directory. We can start out by adding the first directory for 
this workshop:

```bash
$ mkdir compphylo-workshop
```

`mkdir` stands for **"make directory"**, and unlike the other two commands, this command takes one "argument". This argument is the name of the directory you wish to create, so here we direct mkdir to create a new directory called "ipyrad-workshop". Now you can use `ls` again, to look at the contents of your home directory and you should see this new directory now:

```bash
$ ls
compphylo-workshop
```

> **Special Note:** Notice that the above directory we are making is not called `compphylo workshop`. This is **very important**, as spaces in directory names are known to cause havoc on HPC systems. All linux based operating systems do not recognize file or directory names that include spaces because spaces act as default delimiters between arguments to commands. There are ways around this (for example Mac OS has half-baked "spaces in file names" support) but it will be so much for the better to get in the habit now of ***never including spaces in file or directory names***.

Lets get rid of that 'nobackup' directory, since we won't use it. Use `rm -rf`
to **remove** this directory. The `-rf` parts of this command are the *arguments*
to the `rm` command, in this case indicating to remove **r**ecursively and to 
**f**orce to remove everything and not prompt for permission. `rm -rf` can be 
DANGEROUS if you do this on the wrong directory. The command line is like a 
tightrope walk without a net, there is no 'undo' for `rm -rf`.

```bash
$ rm -rf nobackup
```

Throughout the workshop we will be introducing new commands as the need for them arises. We will pay special attention to highlighting and explaining new commands and giving examples to practice with. 

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
directory and will be called `minicondar3`.

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

<a name="example-job-script"></a>
## The queueing system and an example Job Submission Script

Abel utilizes a [SLURM](https://slurm.schedmd.com/documentation.html) workload
management system for handling job submission, queueing, and resource allocation.
In this workshop we will only be scratching the surface of how to interact with it,
and all the powerful things you can do. For more information you can see the very 
detailed [job script documentation on the UiO Abel site](https://www.uio.no/english/services/it/research/hpc/abel/help/user-guide/job-scripts.html)

The general idea is that we will need to write simple scripts to tell the 
cluster what we want to run, how we want to run it, and what kinds of resources
to allocate. We'll practice with a simple script here.

We will use the `nano` text editor to create a new job submission script, like this:

```bash
nano myfirst.job
```

Nano is a very basic text editor, so you'll need to use only the arrow keys 
on the keyboard for navigating around the file. Nano accepts a few special
keyboard commands for doing things other than modifying text, and it lists 
these on the bottom of the frame. Edit the file to contain this text:

```
#!/bin/bash
#SBATCH --account=nn9458k
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=1G

cd ~/compphylo_workshop/
echo "Hello World" > watdo.txt
```
> **NB:** The `~` character is a shortcut which represents your home directory.
> **NB:** The `account`, `time`, and `mem-per-cpu` parameters are compulsory, your job will not run if any of them are not specified.


After you finish the script you may save and exit nano by typing CTRL+o 
(to write **O**utput), and then CTRL+x (to e**X**it the program).

> **Note:** The `CTRL+x` notation indicates that you should hold down the control key (which is often styled 'ctrl' on the keyboard) and then push 'x'.

Submit this job to the cluster with `sbatch` and if your job script is well 
formed you'll receive notification that the job was submitted as well as the
job id #:

```
$ sbatch myfirst.job
Submitted batch job 27708069
```

And now monitor the progress of the job with `squeue:

```
$ squeue -u iovercast
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
          27708069    normal myfirst. iovercas R        0:02      1 c16-1
```

`squeue` shows all the critical information about your running jobs, including the 
job status (**ST**), the job ID #, and the name of the compute node the job is
running on (here `c16-1`). If the job is pending (**PD**) the reason for the delay
will show in the `NODELIST(REASON)` feild. The complete documentation of status codes 
and "REASON" codes are provided on the [squeue man page](https://slurm.schedmd.com/squeue.html).

You'll know your job is finished because it won't be in the queue anymore:

```                                                                                                                                                    
$ squeue -u iovercast                                                                                                                                  
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)                                                                   
```   

Also, there will be a new file in your `work` directory, which you can examine:

```bash
cat ~/compphylo_workshop/watdo.txt
```
    Hello World

This is essentially how all cluster job submission scripts act, just with
(hopefully) more complicated and interesting results.

<a name="interactive-session"></a>
## Establish an interactive session

Finally, it is often handy to get an interactive session on a compute node
rather than writing a job submission script, for example if you need to 
tinker with your computational workflow in the live cluster environment,
or maybe you just prefer to operate your own stuff at the command line. In
this case you can request an interactive session which will drop you onto
the command line on a compute node.

The `qlogin` command will grant you an interactive session, but it takes
a bunch of arguments that would be annoying to type out every time, so
lets just write a quick script. Use `nano` to edit a file called 
`qlogin.sh` and type out the following commands:

```bash
#!/bin/bash                                                                                                
                                                                                                                                                       
qlogin --account=nn9458k --ntasks 1 --cpus-per-task 4
```

Now you can run this script and verify that you ended up on a compute node.

```bash
$ bash qlogin.sh
```
    salloc: Pending job allocation 27784665 
    salloc: job 27784665 queued and waiting for resources
    salloc: job 27784665 has been allocated resources
    salloc: Granted job allocation 27784665
    srun: Job step created
```bash
$ hostname
```
    compute-15-4.local

BAM!
$ hostname
compute-15-4.local
