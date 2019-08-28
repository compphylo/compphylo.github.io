## Setting up ABLE normally (_i.e._ outside of workshop)
The original install instructions can be found directly from the [ABLE Github repository](https://github.com/champost/ABLE/blob/master/README.md).



## Setting up ABLE for CompPhylo

- Open a terminal from your `Jupyter` notebook and make sure you are in your home folder
```
cd
```

- Download the compiled `ABLE` repository from the shared work folder for project `nn9458k`
```
rsync -a /work/projects/nn9458k/ABLE.tar.bz2 .
tar -xjf ABLE.tar.bz2
```

- Make it easier to run `ABLE` from anywhere on your setup by adding it to the `PATH` variable
```
mkdir bin
cd bin
ln -s ../tmp/ABLE/ABLE ABLE
cd ..
export PATH="$HOME/bin:$PATH"
```

