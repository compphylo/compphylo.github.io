# UiO High Performance Computing System (Abel)
Computational resources for the duration of this workshop have been generously provided by the *__who to credit__*. We have been assigned Notur project __NN9458K: ForBio course: Phylogenomics__. The HPC we will be using is located at:
```
abel.uio.no
```
* [Abel queueing system](https://www.uio.no/english/services/it/research/hpc/abel/help/user-guide/queue-system.html)
* [Abel FAQ](https://www.uio.no/english/services/it/research/hpc/abel/help/faq/)

## Example Job Submission Script

Very detailed [job script documentation on the UiO Abel site](https://www.uio.no/english/services/it/research/hpc/abel/help/user-guide/job-scripts.html)

Open a new file called `myfirst.job` and add the following text:
```
#SBATCH --account=
#SBATCH --time=
```

Submit this job to the cluster with `sbatch` (abel uses the SLURM queue management system):

```
sbatch myfirst.job
```

And now monitor the progress of the job with qstat:

```
squeue
```
