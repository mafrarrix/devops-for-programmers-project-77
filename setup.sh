#!/bin/bash

ANSIBLE_VAULT_PASSWORD_FILE="ansible/ansible_vault_password.txt"
TERRAFORM_SECRETS_FILE="terraform/secrets.auto.tfvars"
VAULT_YML_FILE="ansible/group_vars/webservers/vault.yml"

read -s -p "Enter your Ansible Vault password: " vault_password
echo "$vault_password" > "$ANSIBLE_VAULT_PASSWORD_FILE"

read -p "Enter your pvt_key directory: " pvt_key
read -p "Enter your Datadog db username: " db_username
read -p "Enter your Datadog db_password: " db_password
read -p "Enter your Datadog secret_key: " secret_key

read -p "Enter your DigitalOcean token: " organization_id
read -p "Enter your project_ id: " project_id
read -p "Enter your  api key: " datadog_api_key
read -p "Enter your public key: " public_key

cat <<EOF > "$TERRAFORM_SECRETS_FILE"
pvt_key = "$pvt_key"
db_username = "$db_username"
db_password = "$db_password"
access_key = "$access_key"
secret_key = "$secret_key"
organization_id = "$organization_id"
project_id = "$project_id"
public_key = "$public_key"
EOF

cat <<EOF > "$VAULT_YML_FILE"
Obfuscation:
  datadog_api_key: "$datadog_api_key"
EOF

ansible-vault encrypt "$VAULT_YML_FILE" --vault-password-file "$ANSIBLE_VAULT_PASSWORD_FILE"

echo "Configuration files generated successfully."