Sagemath with the newest JupyterLab notebook (a modern successor to Jupyter), with optional extras!
There are two directories and Dockerfiles - each one building upon the previous:

* `./base` contains the basic image with a full SageMath installation using the JupyterLab notebook, and also includes a Python 3 kernel and notebook.
* `./m2` adds an installation of [Macaulay2](http://www2.macaulay2.com/Macaulay2/), a software system for Commutative Algebra

Builds can be found on DockerHub as:

* [cemulate/sagemath-jupyterlab](https://hub.docker.com/r/cemulate/sagemath-jupyterlab/)
* [cemulate/sagemath-jupyterlab-m2](https://hub.docker.com/r/cemulate/sagemath-jupyterlab-m2/)

Dockerfiles can be found in the Github repo at [cemulate/docker-sagemath-jupyterlab-m2](https://github.com/cemulate/docker-sagemath-jupyterlab-m2).
Release tags on Github correspond to the tags on the two DockerHub images.
Images are tagged identically to the [sagemath/sagemath](https://hub.docker.com/r/sagemath/sagemath/tags) tag that `base` is based on (as of `9.0-py3`, before that a simple revision count was used).

The container's notebook server runs on port `8888`, which must be bound to whatever port you desire.
It is recommended to bind `/home/sage/Notebooks` to a local directory to ensure that your notebooks are persisted.
A sample `docker-compose.yml` that could be used to manage this configuration is as simple as follows:
```
version: '3'

services:
    sagemath:
        image: cemulate/sagemath-jupyterlab-m2
        ports:
            - 5000:8888
        volumes:
            - ./Notebooks:/home/sage/Notebooks
```
Where, of course, the image, external port, and local notebook directy can be changed to whatever you desire.

You must use a token to log into the notebook server for the first time.
This token will be displayed in the container's output, which can be seen in the terminal if run interactively, or retrieved with `docker logs {container_name}`.
You may set a password during the first login by using the token along with a new password.
**Note that the container must be restarted for the new password to take effect** (if started with `docker-compose up -d`, this can be done with `docker-compose restart`).