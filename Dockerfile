#__ import local files to docker 
FROM ubuntu:16.04

# Set up files for installation as well as the home file
RUN mkdir /home/workspace

# Copy necessary Scripts
COPY requirements.txt /home/requirements.txt
COPY ./scripts/install_py.sh /home/install_py.sh
COPY ./scripts/install_jupyter.sh /home/install_jupyter.sh

# Alter permissions for the script, in order to be able to execute them
RUN chmod +x /home/install_py.sh
RUN chmod +x /home/install_jupyter.sh

# Install Python
RUN /home/install_py.sh

# Pyorcloader requires this one as well:
RUN apt-get install -y libpython3.6-dev

# Install Ipython and Jupyter
RUN /home/install_jupyter.sh

# Install Jupyterlab
RUN pip install jupyterlab

# Take care of some unnecessary remnant of the install_python script.
RUN rm ./get-pip.py

# Expose your port 8888
EXPOSE 8888

# cd into the workspace and create an extra folder
WORKDIR /home/workspace
ADD ./data /home/workspace/data
ADD ./notebooks /home/workspace/notebooks

#___________________________________________________________________________________________________________________________________________________#
# Everything is all set up! If you want to copy more files to the container, make use of the following format:
# COPY <local>:<remote>
# It's convenient to use a relative path for <local>, and avoiding spaces in your names. Make sure to include filename as well.
# Note that you are now already in the workspace, so you can use a relative path for remote as well!
# example:
# COPY ./awesome_local_pythonfile.py ./awesome_remote_pythonfile.py
#
# Use the area below to further furnish your container.
#___________________________________________________________________________________________________________________________________________________#
#___________________________________________________________________________________________________________________________________________________#










#___________________________________________________________________________________________________________________________________________________#
#___________________________________________________________________________________________________________________________________________________#
CMD ["sh", "-c", "jupyter lab --port=8888 --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='JupyterLab'"]