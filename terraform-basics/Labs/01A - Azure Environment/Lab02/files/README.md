# Terraform Deploy a Storage Account with Terraform

This project demonstrates how to deploy a **Deploy a Storage Account with Terraform**.

Students will learn how to:

* Authenticate with Azure
* Initialize Terraform
* Plan infrastructure changes
* Deploy a Storage Account in an existing Resource Group

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

## Step 1 — Login to Azure

```bash
az login --use-device-code
az account show
```

NOTE: Ensure to select the correct subscription after login.

---

## Step 2 - Prepare variables

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit terraform.tfvars and set your assigned resource group.


## Step 3 — Initialize Terraform

Navigate to the project folder and run:

```bash
terraform init
```

Terraform will download the required Azure provider.

---

## Step 4 — Terraform workflow and deploy Azure Storage Account

```bash
terraform fmt
terraform validate
terraform plan -out tfplan
terraform apply tfplan
```

Confirm by typing:

```
yes
```

Terraform will now create the Storage Account in an existing Resource Group in Azure.


## Step 5 — Verify in Azure

Go to the Azure Portal:

https://portal.azure.com

Navigate to:

```
Storage Accounts
```

You should see your newly created Storage Account and ensure all settings are expected.

---

## Step 6 — Destroy Resources (Cleanup)

To remove the Storage Account:

```bash
terraform destroy
```

Confirm with:

```
yes
```

---

# Learning Objectives

By completing this exercise students will understand:

* Terraform configuration files
* Infrastructure as Code (IaC)
* Azure authentication
* Terraform deployment workflow for an Storage Account