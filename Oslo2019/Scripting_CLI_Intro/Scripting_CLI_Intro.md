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
* [Look at data](#look-at-data): `head`, `cat`, `less`
* [Find stuff in data](#find-stuff-in-data): `cut`, `grep`
* [Summarize data](#summarize-data): `wc`, `sort`, `uniq`
* [Organize data](#organize-data): `pwd`, `mkdir`, `mv`
* [Modify data](#modify-data): `nano`, `sed`

<a name="look-at-data></a>
## Looking at data

<a name="find-stuff-in-data"></a>
## Find stuff in data

<a name="summarize-data></a>
## Summarize data

<a name="organize-data></a>
## Organize data

<a name="modify-data></a>
## Modify data

## Further resources

* [The python data science handbook](https://jakevdp.github.io/PythonDataScienceHandbook/)

A couple very nice pages of introduction to linux command line
for biologists:
* [https://speciationgenomics.github.io/getting_used_to_unix/]
* [https://speciationgenomics.github.io/going_further_unix/]
