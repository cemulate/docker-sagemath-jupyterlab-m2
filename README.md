Sagemath with the newest JupyterLab notebook (a modern successor to Jupyter), including an installation of Macaulay2 and a corresponding Jupyter kernel

[Repository on DockerHub](https://hub.docker.com/r/cemulate/sagemath-jupyterlab-m2/)

JupyterLab is set up with an initial password of `jupyterlab`. As JupyterLab currently lacks an interface to change the password, you'll have to change this manually:

* `docker exec -it <container> bash` to get a bash shell in the running container
* `sage -sh` to get a shell in Sage installation's environment
* `jupyter notebook password` and follow the prompts to change the password

`sage -sh` is very useful, and you can also use it to install plugins in Sage's JupyterLab installation, with `jupyter labextension install ...` (see [JupyterLab docs](https://github.com/jupyterlab/jupyterlab) for more info)
