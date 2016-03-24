## Basic usage

1. Install docker through [this link](https://docs.docker.com/engine/installation/)
2. In your docker-enabled terminal, run `docker run -t -i --rm -p 8888:8888 kwong999999/anaconda-jupyter-python3.4` to start a Jupyter server on port 8888, note that `--rm` means the instance is removed after you terminate this command, your changes to filesystem in the environment is not persisted
3. For Docker Machine users (Mac, Windows), go to `192.168.99.100:8888`, otherwise go to `localhost:8888`
4. When running the `.ipynb` files from CS109 in the `course` folder, remember to change the kernel to `Python 2 (with libraries for CS109)` to be able to access installed libraries in the environment like `pandas` and `seaborn` (`Kernel` > `Change kernel` > `Python 2 (with libraries for CS109)`)

## Troubleshooting

### When running docker command, if you get error message `Cannot connect to the Docker daemon. Is the docker daemon running on this host?`

Apart from the case when docker daemon is not running, it's also possible that you don't have the correct environment variables set in your current shell (eg.in mac,  you start your own shell instead of using `Docker Quickstart Terminal`), try running ``eval `docker-machine env default` `` to set up the environment variables

