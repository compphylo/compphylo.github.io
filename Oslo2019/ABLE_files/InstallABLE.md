## Setting up ABLE normally (_i.e._ outside of workshop)
The original install instructions can be found directly from the [ABLE Github repository](https://github.com/champost/ABLE/blob/master/README.md).



## Setting up ABLE for CompPhylo

- Open a terminal from your `Jupyter` dashboard and make sure you are in your `HOME` folder. You should be in either `/usit/abel/u1/<username>` or `/cluster/home/<username>`
```
cd
pwd
```

- **ONLY for the TEST users**. You will have to do an additional `cd <username>` which should get you to either `/usit/abel/u1/isaactest/<username>` or `/cluster/home/isaactest/<username>`
```
cd
pwd
```

- Download the compiled `ABLE_compphylo` setup from the shared folder for project `nn9458k`
```
rsync -a /work/projects/nn9458k/ABLE_compphylo.tar.bz2 .
tar -xjf ABLE_compphylo.tar.bz2
```

- We shall try to make it easier to run `ABLE` from any folder on your `Jupyter` notebook setup (**not for the TEST users**)
```
cd
mkdir bin
cd bin
ln -s ../ABLE_compphylo/ABLE/ABLE ABLE
```

- And finally we will run this command (which adds the `bin` folder to the `PATH` variable) whenever necessary (**not for the TEST users**)
```
export PATH="$HOME/bin:$PATH"
```

