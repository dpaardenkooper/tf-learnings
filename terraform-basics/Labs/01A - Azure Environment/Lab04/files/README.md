# Terraform Deploy in different enviornments with Terraform via Modules

This project demonstrates how to deploy a **Deploy in different enviornments with Terraform via Modules**.

Students will learn how to:

* Authenticate with Azure
* Initialize Terraform
* Plan infrastructure changes
* Deploy a VM

---

## Prerequisites

Before starting, make sure you have installed:

* Terraform
* Azure CLI

Verify the installations:

```bash
terraform -version
az --version
```

---

## Step 1 - Login to Azure

```bash
az login --use-device-code
az account show
```

NOTE: Ensure to select the correct subscription after login.

## Step 2 - Prepare variables

```bash
cp environments/dev.tfvars.example environments/dev.tfvars
cp environments/test.tfvars.example environments/test.tfvars
cp environments/prod.tfvars.example environments/prod.tfvars
```

Edit environments/\*.tfvars and set your assigned resource group.

## Step 3 - Create workspaces

```bash
terraform workspace new dev
terraform workspace new test 
terraform workspace new prod
```

## Step 4 - Initialize Terraform and run the workflow

<I>dev environment:</I>

```bash
terraform workspace select dev
terraform init
terraform fmt
terraform validate
terraform plan -var-file="environments/dev.tfvars"
terraform apply -var-file="environments/dev.tfvars"
```

Confirm with:

```
yes
```

<I>test environment</I>:

```bash
terraform workspace select test
terraform init
terraform fmt
terraform validate
terraform plan -var-file="environments/test.tfvars"
terraform apply -var-file="environments/test.tfvars"
```

Confirm with:

```
yes
```

<I>prod environment</I>:

```bash
terraform workspace select prod
terraform init
terraform fmt
terraform validate
terraform plan -var-file="environments/prod.tfvars"
terraform apply -var-file="environments/prod.tfvars"
```

Confirm with:

```
yes
```

## Step 5 - Verify in Azure Portal

1) Go to Foundry in the Azure Portal and ensure all settings are expected

---

## Step 5 - Destroy Resources (Cleanup)

<I>dev environment</I>:

```bash
terraform workspace select dev
terraform destroy -var-file="environments/dev.tfvars"
```

Confirm with:

```
yes
```

<I>test environment</I>:

```bash
terraform workspace select test
terraform destroy -var-file="environments/test.tfvars"
```

Confirm with:

```
yes
```

<I>prod environment:</I>

```bash
terraform workspace select prod
terraform destroy -var-file="environments/prod.tfvars"
```

Confirm with:

```
yes
```

---

# Learning Objectives

By completing this exercise students will understand:

* Terraform configuration files
* Terraform Workspaces
* Infrastructure as Code (IaC)
* Learning to use Modules confirm DRY (Don't Repeat Yourself)
* Selective Terraform deployment based on Terraform Modules