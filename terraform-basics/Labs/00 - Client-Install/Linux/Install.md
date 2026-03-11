# Installing Terraform on Linux

This guide explains how to install **Terraform** on a **Linux system** so you can use it during the course.

---

# Prerequisites

Before installing Terraform, make sure you have:

* A **Linux system** (Ubuntu, Debian, Fedora, etc.)
* Access to a **terminal**
* Permission to install software
* Internet access

The recommended installation method uses the **official HashiCorp repository**.

---

# 1. Install Required Tools

Open a **terminal** and run:

```bash
sudo apt update
sudo apt install -y gnupg software-properties-common curl
```

These tools allow your system to securely download packages.

---

# 2. Add the HashiCorp GPG Key

Run the following command to add the official HashiCorp security key:

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

---

# 3. Add the HashiCorp Repository

Add the official Terraform repository:

```bash
sudo apt-add-repository "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

---

# 4. Install Terraform

Update the package list and install Terraform:

```bash
sudo apt update
sudo apt install terraform
```

---

# 5. Verify the Installation

Check that Terraform is installed correctly:

```bash
terraform -version
```

You should see output similar to:

```
Terraform v1.x.x
```

---

# 6. Test Terraform

Create a test directory and initialize Terraform:

```bash
mkdir terraform-test
cd terraform-test
terraform init
```

If Terraform initializes without errors, the installation was successful.

---

# Updating Terraform

To update Terraform to the latest version:

```bash
sudo apt update
sudo apt upgrade terraform
```

---

# Alternative Installation (Manual Download)

If the package manager installation does not work, you can install Terraform manually.

1. Go to the Terraform download page:

[https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)

2. Download the **Linux AMD64** zip file.

3. Extract the file:

```bash
unzip terraform_<version>_linux_amd64.zip
```

4. Move Terraform to a system directory:

```bash
sudo mv terraform /usr/local/bin/
```

5. Verify the installation:

```bash
terraform -version
```

---

# Troubleshooting

### Terraform command not found

Check if Terraform is installed correctly:

```bash
which terraform
```

If nothing is returned, verify that `/usr/local/bin` is in your PATH.

---

# Additional Resources

Terraform documentation:

[https://developer.hashicorp.com/terraform/docs](https://developer.hashicorp.com/terraform/docs)

Terraform tutorials:

[https://developer.hashicorp.com/terraform/tutorials](https://developer.hashicorp.com/terraform/tutorials)

---

# Summary

Steps to install Terraform on Linux:

1. Install required tools (`curl`, `gnupg`)
2. Add the HashiCorp repository
3. Install Terraform with `apt`
4. Verify the installation with `terraform -version`
5. Test with `terraform init`

You are now ready to start using Terraform.
