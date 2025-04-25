# Infrastructure as code with Terraform and Ansible
### Hexlet tests and linter status:
[![Actions Status](https://github.com/mafrarrix/devops-for-programmers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/mafrarrix/devops-for-programmers-project-77/actions)

In this project, we employ Terraform to provision infrastructure on Scaleway, including 2 Scaleway Instance, 1 database, 1 load balancer, and 1 domain. Subsequently, we utilize Ansible to orchestrate the deployment of containerized applications. Specifically, we deploy Wiki.js as a Dockerized application and set up monitoring using Datadog.

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) (install the latest version)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) (install the latest version)
- [Scaleway Account](https://www.scaleway.com/fr/) (sign up if you don't have one)
- [Make](https://www.gnu.org/software/make/)


## Installation guide

### *Setting up SSH Key*
Before running Terraform to create your Scaleway Instance, you need to ensure that you have an SSH key set up and associated with your Scaleway account. Here are the steps to do that:

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


1. Clone the repository:

   ```https://github.com/mafrarrix/devops-for-programmers-project-77```

2. Change into the project directory:

   ```cd devops-for-programmers-project-77```

3. Automate Configuration Setup

To simplify the setup process, you can use an automated script to create the necessary configuration files and securely manage sensitive information. Follow these steps:

- Run the setup script by executing the following command:

```bash
   make setup
```
The script will prompt you to enter your Ansible Vault password, Scaleway token, Datadog API key, and Datadog App key.

Once you've provided the required information, the script will automatically generate the configuration files:
- `ansible/ansible_vault_password.txt` with your Ansible Vault password.
- `terraform/secrets.auto.tfvars` with your Scaleway token.
- `~/devops-for-programmers-project-77/group_vars/webservers/vault.yml` with your Datadog API key and App key securely stored.

4. **Initialize the Infrastructure:** Run the terraform init command to initialize Terraform:

   ```make init```

5. **Apply Infrastructure Changes:** Run the terraform apply command to create a Droplet with Nginx installed on DigitalOcean:

   ```make apply```

After executing the terraform apply command, Terraform will provide you with information about the created Droplet, including its IP address.

Open your web browser and visit the Droplet's IP address to see the default Nginx page.

6. **Install Ansible Roles:** Before running the playbook, make sure you have the required Ansible roles installed. You can install>

   ```bash
   make install-roles
   ```
To access the newly created Scaleway Instance, you can connect using the following command: `ssh root@IP_address_of_your_droplet` You can find the IP address in either the inventory file located in the Ansible directory or within the DigitalOcean project.

7. **Deploy Your Application to Scaleway Instance:** Deploy your application to the Scaleway Instance by executing the following command:

    ```bash
    make deploy
    ```

## Deployed Application

You can find the deployed application at the following link:

- [Wiki.js](http://www.mafrarrix.shop/)

### *Destroying Infrastructure*

To remove the created  resources, run the command:

   ```make destroy```

WARNING: This command will permanently delete the created Droplet and associated resources. Please be cautious when using this command.
Makefile Commands


### License

This project is licensed under the MIT License.

[output_part1.webm](https://github.com/user-attachments/assets/f865336f-4939-424b-96d5-dae3c02912c3)

[Video del 20-03-2025 22:13:24 terraform.webm](https://github.com/user-attachments/assets/1b4caf40-471c-4177-8b97-c1d5b105aff3)


