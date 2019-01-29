# Goal

This repository serves as a demonstration for running a jupyter lab server within a container. Only for educational purposes.

# Usage
## cd into the directionary of cloning

## Build the container
docker build -t lab .
This might take quite some time

## Run the container
docker run -it -d -p [pick a port]:8888 --name lab lab

## Open a browser
And go to http://localhost:[pick a port]

## Default Password: JupyterLab

That's it! Now you are running a jupyterlab from within the notebook.