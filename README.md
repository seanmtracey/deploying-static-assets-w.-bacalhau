# Deploying Static Assets to nginx Server w. Bacalhau

This repo contains the scripts and assets for configuring and deploying nginx assets dynamically across multiple instances with Bacalhau.

## job.yaml
The job file for describing the tasks and workloads that Bacalhau will deploy to servers running Bacalhau in a private network.

## userdata_compute.sh
A user data file for configuring an Ubuntu 24.04 server to:

- Install Docker
- Install Bacalhau
- Install nginx
- Join a Bacalhau Network with a given IP

## userdata_requester.sh
A user data file for configuring an Ubuntu 24.04 server to:

- Install Docker
- Install Bacalhau
- Run a Bacalhau Requester node to manage workloads across a private Bacalhau Network

## generate_script.sh

A convenience script used by the Bacalhau CLI to embed the index.html file in a Python script, Base64 encode that script, and then return it for deployment to a Bacalhau node as part of a job.