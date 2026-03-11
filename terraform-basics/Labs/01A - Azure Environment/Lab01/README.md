# Lab 2 — Deploy a Key Vault with Terraform

## 0) Login to Azure

```bash
az login --use-device-code
az account show
```

NOTE: Ensure to select the correct subscription after login.

## 1) Prepare variables

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit terraform.tfvars and set your assigned resource group.

## 2) Terraform workflow

```bash
terraform init
terraform fmt
terraform validate
terraform plan -out tfplan
terraform apply tfplan
```

## 3) Check the Key Vault in the Azure Portal

1) Go to the Key Vault in the Azure Portal and ensure all settings are expected

## 4) Cleanup

```bash
terraform destroy
```
