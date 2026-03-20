# Terraform Deploy a Linux VM with Terraform

This project demonstrates how to deploy a **Deploy a Linux VM with Terraform**.

Students will learn how to:

* Authenticate with Active Directory
* Initialize Terraform
* Plan infrastructure changes
* Deploy a VM

---

## Prerequisites

Before starting, make sure you have installed:

* Terraform

Verify the installations:

```bash
terraform -version
az --version
```

---

## Step 1 — Create a vCenter Service account in Active Directory which have the following permissions

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

Terraform will now create the VM in an existing vSphere folder within vCenter.

## Step 5 - Verify in VCenter and Connect to the VM

1) Go to the VM in the vCenter Portal.
2) Rightclick 'Connect' 

You should now be logged in to your VM through vCenter.

NOTE: You will need to have access to the SSH key or admin credentials depending on the configuration earlier taken into the proces created in step 1 from your browser. 

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
* Active Directory authentication
* Terraform deployment workflow for an VM in vCenter
