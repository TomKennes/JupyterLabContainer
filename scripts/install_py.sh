apt-get update
apt-get install -y software-properties-common
apt-get update
add-apt-repository ppa:deadsnakes/ppa
apt-get update
apt-get install wget
apt-get install -y python3.6
wget https://bootstrap.pypa.io/get-pip.py
python3.6 get-pip.py
apt-get install python3-dev
pip install -r /home/requirements.txt
pip install setuptools


