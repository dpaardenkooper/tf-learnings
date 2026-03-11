# Terraform Azure Resource Group Deployment

This project demonstrates how to deploy a **Resource Group in Microsoft Azure using Terraform**.

Students will learn how to:

* Authenticate with Azure
* Initialize Terraform
* Plan infrastructure changes
* Deploy a Resource Group

---

# Prerequisites

Before starting, make sure you have installed:

* Terraform
* Azure CLI

Verify the installations:

```bash
terraform -version
az --version
```

---

# Step 1 — Login to Azure

Authenticate with your Azure account.

```bash
az login
```

This will open a browser where you can sign in.

After logging in, set your subscription:

```bash
az account set --subscription "SUBSCRIPTION_NAME"
```

To list available subscriptions:

```bash
az account list --output table
```

---

# Step 2 — Project Files

This project uses several Terraform files.

| File             | Purpose                          |
| ---------------- | -------------------------------- |
| provider.tf      | Configures the Azure provider    |
| variables.tf     | Defines variables                |
| terraform.tfvars | Stores variable values           |
| main.tf          | Creates the Azure resource group |
| outputs.tf       | Displays useful output           |

---

# Step 3 — Initialize Terraform

Navigate to the project folder and run:

```bash
terraform init
```

Terraform will download the required Azure provider.

---

# Step 4 — Review the Deployment Plan

Run:

```bash
terraform plan
```

This shows what Terraform will create.

Example output:

```
Plan: 1 to add, 0 to change, 0 to destroy
```

---

# Step 5 — Deploy the Resource Group

Apply the deployment:

```bash
terraform apply
```

Confirm by typing:

```
yes
```

Terraform will now create the resource group in Azure.

---

# Step 6 — Verify in Azure

Go to the Azure Portal:

https://portal.azure.com

Navigate to:

```
Resource Groups
```

You should see your newly created resource group.

---

# Step 7 — Destroy Resources (Cleanup)

To remove the resource group:

```bash
terraform destroy
```

Confirm with:

```
yes
```

---

# Terraform Workflow Summary

```
terraform init
terraform plan
terraform apply
terraform destroy
```

---

# Learning Objectives

By completing this exercise students will understand:

* Terraform configuration files
* Infrastructure as Code (IaC)
* Azure authentication
* Terraform deployment workflow