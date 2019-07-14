Sagemath with the newest JupyterLab notebook (a modern successor to Jupyter), with optional extras!
There are three directories and Dockerfiles - each one building upon the previous:

* `./base` contains the basic image with a full SageMath installation using the JupyterLab notebook.

* `./m2` adds an installation of [Macaulay2](http://www2.macaulay2.com/Macaulay2/), a software system for Commutative Algebra

Builds can be found on DockerHub as:

* [cemulate/sagemath-jupyterlab](https://hub.docker.com/r/cemulate/sagemath-jupyterlab/)
* [cemulate/sagemath-jupyterlab-m2](https://hub.docker.com/r/cemulate/sagemath-jupyterlab-m2/)

JupyterLab is set up with an initial password of `jupyterlab`. As JupyterLab currently lacks an interface to change the password, you'll have to change this manually:

* `docker exec -it <container> bash` to get a bash shell in the running container
* `sage -sh` to get a shell in Sage installation's environment
* `jupyter notebook password` and follow the prompts to change the password

Many things can be done with the jupyter installation from the `sage -sh` environment, such as installing plugins in Sage's JupyterLab installation with `jupyter labextension install ...` (see [JupyterLab docs](https://github.com/jupyterlab/jupyterlab) for more info)
