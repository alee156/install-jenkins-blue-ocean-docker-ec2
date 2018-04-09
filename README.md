# Launch Jenkins Blue Ocean on an EC2 Instance Using Ansible

This in an ansible playbook that installs Jenkins Blue Ocean on an AWS EC2 host. It will install Jenkins running in a docker container, binding the Jenkins container to the host's Docker socket so Jenkins can launch its own docker containers on the host, for pipeline workflows. Jenkins will be running on port 8080 on the EC2 host. 

Additionally, the installation process will install and plugins you specify in the `plugins.txt` file. 

## Configuration

To start, you will need an EC2 instance with python2 installed. 

Then, take a look in the `hosts` file, and add the following bits of data:
* EC2 host IP
* The user you use to log into the EC2 host
* The private key used to SSH into the EC2 host (PEM file)

This playbook assumes you are installing on an Ubuntu instance. If you are not, its not difficult to reconfigure things, but you will have to change the following things in the playbook:

* References to the user's home path are currently /home/ubuntu - change to your user
* The docker installation method is based on Ubuntu binaries - swap out commands for your distro

## Usage

Once you have configured things, run this command:

    $ ansible-playbook --inventory=hosts install_jenkins.yml

At the end of the Ansible execution, you will see debug statement that gives you the initial admin password for the Jenkins instance. You will need this to log in as the user `admin` for the first time (please change it as soon as you do).