# Terraform Deploy a Linux VM with Terraform

This project demonstrates how to deploy a **Deploy a Linux VM with Terraform**.

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

## Step 2 - Create SSH key

```bash
mkdir .ssh
ssh-keygen -t ed25519 -f .ssh/tf-lab01 -C "tf-lab01" -N ""
```

## Step 3 - Prepare variables

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit terraform.tfvars and set your assigned resource group.

## Step 4 — Initialize Terraform

Navigate to the project folder and run:

```bash
terraform init
```

Terraform will download the required Azure provider.

---

## Step 5 - Terraform workflow and deploy VM with Linux

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

Terraform will now create the VM in an existing Resource Group in Azure.

## Step 5 - Verify in Azure and Connect to the VM

1) Go to the VM in the Azure Portal.
2) Click 'Connect' -> 'Connect via Bastion'
3) For `Authentication Type`, select `SSH Private Key from Local File`
4) For `Username`, use `azureuser`
5) For `Local File`, either select the `.ssh/tf-lab01` file or the `tf-lab01.pem` file if you are running the Azure Portal from a different machine (see note below)
6) Click 'Connect'

You should now be logged in to your VM through Bastion.

NOTE: You will need to have access to the SSH key created in step 1 from your browser. If you are using the Azure Portal on a different machine, ensure
to copy the contents of `~/.ssh/tf-lab` into a file named `tf-lab01.pem` somewhere on the machine you use for accessing the Azure Portal.
You will need to provide this file to be able to connect to the VM via Bastion.

---

## Step 6 - Destroy Resources (Cleanup)

To remove the VM:

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
* Terraform deployment workflow for an VM
