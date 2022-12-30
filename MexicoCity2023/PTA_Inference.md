# Phylogeographic Temporal Analysis (PTA)
## Inferring shared demographic response using machine learning

> ### **Questions:**
>
> - What exactly do I do with all these PTA simulations?
> - How does machine learning (ML) simulation-based inference work?
> - What do the ML results *tell* me?
> 
> ### **Learning objectives:**
>
> - Understand ML classification and regression.
> - Implement ML inference with toy data and pre-baked simulations.
> - Plot and interpret ML inference.
> - Understand the steps to reproduce this analysis with your own data on your own computer.

### Accessing a jupyter notebook on the cloud

Click the '+' sign to open the App Launcher again. This time under the "Notebook"
heading double-click "Python 3 (ipykernel)" to launch a new jupyter notebook.
### PTA API mode

### Download pre-baked simulations and toy empirical data
**NB:** Here we can play the game where we give them a simulated dataset with a known zeta and see if they can figure it out.

#### Sanity checking your simulations

```
%matplotlib inline
import PTA
PTA.plotting.plot_simulations_pca("example_data/MG-Snakes/MG-Snakes-SIMOUT.csv", target="t_s")
```
![Inference Plot PCA](img/Inference-PlotPCA.png)

> #### **Challenge: Plot the PCA with different 'target' parameters**
> Look back at the 'parameters' in the column header of the MG-Snakes-SIMOUT.csv
> file. Choose one that you think might show differences in the simulations.
> Try to stick with the ones in the first 11 columns as these are the ones with
> variation in our particular simulations. First, make sure you are clear on what
> this parameter *means*, and if you have questions talk with your partner or ask
> one of the instructors. Next, modify the call to `plot_simulations_pca` to use
> this new parameter as the 'target'. What do you see in the PCA? Is there
> clear separation of the simulations based on the selected target parameter?
> Think about why this might be. If you have more time try to find the parameter
> that generates the best separation in the data. What is it?

**Is it useful to show simulations that don't make sense?** Maybe I could show the bad
simulations with bad Ne values to show that you need to be careful with parameters.

### ML classification (model selection)


### Interpreting ML classification results

### ML regression (parameter estimation)



### Interpreting ML regression results

### Next steps: How do run this on your *own* data

