# Deploy a vSphere Folder with Terraform in vCenter

This project demonstrates how to deploy a **Deploy a vSphere Folder with Terraform in vCenter**.

Students will learn how to:

* Authenticate with Azure
* Initialize Terraform
* Plan infrastructure changes
* Deploy a vSphere Folder in vCenter

---

## Prerequisites

Before starting, make sure you have installed:

* Terraform

Verify the installations:

```bash
terraform -version
```

---

## Step 1 — Create a vCenter Service account which have the following permissions

For more information, click [here](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs)

## Step 2 — Prepare variables

git clone this repo.

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit terraform.tfvars and set your assigned vSphere folder.


## Step 3 — Initialize Terraform

Navigate to the project folder and run:

```bash
terraform init
```

Terraform will download the required vSphere provider.

---


## Step 4 — Terraform workflow and deploy vSphere folder

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

Terraform will now create a vSphere folder in the existing vCenter server, under DataCenter.


## Step 5 — Verify in vCenter

Go to the vCenter

Navigate to DataCenter and check if you see the corresponding folder:

```
Training
```

---

## Step 6 — Destroy Resources (Cleanup)

To remove the vSphere Folder:

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
* Terraform deployment workflow from a vSphere folder