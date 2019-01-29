# Goal

This repository serves as a simple demonstration for running a jupyter lab server within a container, and nothing more than that. Hence, I made it available solely for educational purposes.

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