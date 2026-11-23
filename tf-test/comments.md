winget install --id Hashicorp.Terraform
winget install --id Microsoft.AzureCLI

az login
az account show
terraform init
terraform apply -auto-approve