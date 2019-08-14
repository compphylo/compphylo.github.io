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

