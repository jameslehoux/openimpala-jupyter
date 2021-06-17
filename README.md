# openimpala-jupyter
Repository to host container and notebook files used for the OpenImpala Jupyter visualisation training materials using yt


## Citation

If you've used OpenImpala in the preparation of a publication, please consider citing this publication: https://doi.org/10.1016/j.softx.2021.100729 

This work is funded by the EPSRC and STFC.

## Getting Started

To get started, firstly, all the training materials are available on a public Git repository: https://github.com/jameslehoux/openimpala-jupyter. Essentially, we’ve created a minimal Dockerfile to act as a recipe for Jupyter notebooks; this recipe installs python, pip, Singularity and its dependencies, yt, and finally, the training material from the Git repository. 

You can use a (free) service like Binder to get an interactive notebook in a web browser. So if you visit: https://mybinder.org/, you can then paste the above git repository into the box and click launch. Binder will then construct a container from the Dockerfile recipe, containing everything we need to get going. 

That should take a few minutes to build; it’ll then launch into a Jupyter instance which should look familiar. (N.B. the Binder servers should hold onto the image for a little while so that if you want to start a new instance, it’ll load up much quicker). If you go into openimpala-jupyter and then click on OpenImpala_Visualisation.ipynb, you’ll launch into the visualisation notebook.

This notebook uses some example lithium iron phosphate CT data to show how to make different plots. 

You could then run your own instance for your own data or use the notebook as a way to trial different plot types to see what looks best.
