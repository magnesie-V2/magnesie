# Magnesie V2

## Project presentation

This project's goal is to use micro-services to generate 3D-models of any object and make them available on a website. The idea is to only deploy and run the photogrammetry service to generate the models when the cluster on which it will be deployed has available green energy.

This project is based on the first version of magnesie : https://github.com/magnesie/magnesie


## Install & run

+ This repository `magnesie` centralizes all sub-projects for the back-end part of the architecture.
+ To install and run all of these, you just need to execute these commands :
    + `git clone --recurse-submodules`
    + `cd magnesie/`
    + `docker-compose up`
+ All services are exposed to the outside, expect database component. Exposed ports are configured in `.env` file.

## Grid5000 environment

### Prerequisite
+ Grid'5000 account
+ SSH keys : write pub key on Grid'5000 account settings

### Commands
```sh
# Connect to Grid'5000 front (use ssh private key)
ssh <login>@access.grid5000.fr

# Go to a Grid'5000 site
ssh nantes

# Reserve a Grid'5000 node
oarsub -I
# (It generates a job_id that you can use to access to the node from another terminal : $ oarsub -C <job_id>)
# (Note the reserved node ID for next step)

# Install docker and docker-compose on node
g5k-setup-docker -t
sudo-g5k curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo-g5k chmod +x /usr/local/bin/docker-compose
sudo-g5k ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

### Install and launch your webservice...

# Port forward to access to webservice from your local machine
ssh <login>@access.grid5000.fr -L <local-port>:<g5k-node>.<site>.grid5000.fr:<remote-port>
## For example, you reserved node 'econome-16' at nantes. To forward all service ports from this node to your local machine, execute this commande :
ssh <login>@access.grid5000.fr \
 -L 7879:econome-16.nantes.grid5000.fr:7879 \
 -L 7880:econome-16.nantes.grid5000.fr:7880 \
 -L 7881:econome-16.nantes.grid5000.fr:7881

```