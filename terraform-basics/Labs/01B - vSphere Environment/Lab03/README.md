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

## Step 1 — Create a vCenter Service account in Active Directory which have the following permissions

For more information, click [here](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs)

## Step 2 — Prepare variables

git clone this repo.

```bash
cp environments/dev.tfvars.example environments/dev.tfvars
cp environments/test.tfvars.example environments/test.tfvars
cp environments/prod.tfvars.example environments/prod.tfvars
```

Edit environments/\*.tfvars and set your assigned vSphere folder.

---

## Step 3 - Create workspaces

```bash
terraform workspace new dev
terraform workspace new test 
terraform workspace new prod
```


## Step 4 - Terraform workflow and deploy VM with Linux

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
* Terraform deployment workflow for an VM in vCenter via modules
