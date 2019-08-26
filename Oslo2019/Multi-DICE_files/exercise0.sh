#R CMD INSTALL MultiDICE_1.0.1.tar.gz

unzip fsc26_linux64.zip

chmod +x fsc26_linux64/fsc26

screen -S exercise1

/usit/abel/u1/iovercast/miniconda3/bin/conda init

bash

conda activate Multi-DICE-dev

R
