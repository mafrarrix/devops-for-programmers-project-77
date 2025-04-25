# Infrastructure as code with Terraform and Ansible
### Hexlet tests and linter status:
[![Actions Status](https://github.com/mafrarrix/devops-for-programmers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/mafrarrix/devops-for-programmers-project-77/actions)

In this project, we employ Terraform to provision infrastructure on DigitalOcean, including 2 droplets, 1 database, 1 load balancer, and 1 domain. Subsequently, we utilize Ansible to orchestrate the deployment of containerized applications. Specifically, we deploy Wiki.js as a Dockerized application and set up monitoring using Datadog.

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) (install the latest version)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) (install the latest version)
- [Scaleway Account](https://www.scaleway.com/fr/) (sign up if you don't have one)
- [Make](https://www.gnu.org/software/make/)


## Installation guide

### *Setting up SSH Key*
Before running Terraform to create your Droplets, you need to ensure that you have an SSH key set up and associated with your DigitalOcean account. Here are the steps to do that:

1. **Check for Existing SSH Key (Optional):**

First, check if you already have an SSH key pair on your local machine. You can do this by running the following command:

```bash
   cat ~/.ssh/id_rsa.pub
```
2. **Generate an SSH Key Pair (If Needed):**

If you don't have an existing SSH key, you can generate one by running the following command:

```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

This will generate a new SSH key pair. The public key will be located in `~/.ssh/id_rsa.pub`.

### *Scaleway*
- In the scaleway dashboard, go to Settings > Security > SSH Keys.
- Click on the Add SSH Key button.
- Give your SSH key a name (e.g., "My SSH Key").
- In the Public Key Content field, paste the content of your public key file (~/.ssh/id_rsa.pub).
- Click Add SSH Key to save it.

Now you have an SSH key associated with your DigitalOcean account. You can use this key in your Terraform configuration to create Droplets. If you already had an existing id_rsa.pub key, you can simply upload it to your DigitalOcean account and proceed with using it.

### *Setup Terraform*

### *Setup Ansible*

### *Initialize project*


### License

This project is licensed under the MIT License.
