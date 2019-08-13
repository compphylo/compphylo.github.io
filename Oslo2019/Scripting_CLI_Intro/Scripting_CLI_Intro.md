# Intro to linux CLI data manipulation for biologists
This is an intro to data manipulation and intermediate command line scripting
for biologists. We assume a basic familiarity with command line interactions,
and instead focus here on the most useful tools for manipulating data.

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

### Getting set up
Start by making an ssh connection to the cluster](../UiO_Cluster_info.html).
Once you have gotten logged use `git` to fetch some data:

```bash
git clone https://github.com/speciationgenomics/unix_exercises.git
```

Things we want to be able to do:
* [Look at data](#look-at-data): `head`,`tail`, `cat`, `less`
* [Find stuff in data](#find-stuff-in-data): `cut`, `grep`
* [Summarize data](#summarize-data): `wc`, `sort`, `uniq`
* [Organize data](#organize-data): `pwd`, `mkdir`, `mv`, `cp`
* [Modify data](#modify-data): `nano`, `sed`

See the help for any of these functions with: `man [cmd]`

## Look at data

#### head
Head displays the first count of lines in a file.

```bash
## indicate the number of lines to include with `-n`
## the default is 10
$ head -n 5 iris_data.tsv
Sepal.Length	Sepal.Width	Petal.Length	Petal.Width	Species
5.1	3.5	1.4	0.2	setosa
4.9	3	1.4	0.2	setosa
4.7	3.2	1.3	0.2	setosa
4.6	3.1	1.5	0.2	setosa
5	3.6	1.4	0.2	setosa
```

#### tail
Tail displays the last lines of a file.
```bash
## show the last 10 lines in the file
$ tail iris_data.tsv
## tail used with `-n+` and will remove files from the beginning of the file
## here, we remove the first 50 lines of the file
$ tail -n+50 iris_data.tsv
```

#### cat
Concatenates and prints files
```bash
## cat will show all contents of the file
$ cat mobydick.txt

## can be used to combine the contents of multiple files into Once
$ cat mobydick.txt udrh.txt > combinedExample.txt
```
#### less
Used for viewing files and allows backward movement in the file, as well as forward movement.
```bash
## use `q` to exit
$ less mobydick.txt
```

## Find stuff in data

## Summarize data

## Organize data

## Modify data

## Further resources

* [The python data science handbook](https://jakevdp.github.io/PythonDataScienceHandbook/)

A couple very nice pages of introduction to linux command line
for biologists:
* [https://speciationgenomics.github.io/getting_used_to_unix/]
* [https://speciationgenomics.github.io/going_further_unix/]
