# Installing Terraform on macOS

This guide explains how to install **Terraform** on a **Mac system** so you can use it during the course.

---

## Prerequisites

Before installing Terraform, make sure you have:

* A **Mac running macOS**
* **Terminal** access
* **Homebrew** installed (recommended package manager for macOS)

If you do not have Homebrew installed, follow the instructions below.

---

# 1. Install Homebrew (if not installed)

Homebrew is a package manager that makes it easy to install tools like Terraform.

Open **Terminal** and run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Verify the installation:

```bash
brew --version
```

If Homebrew is installed correctly, you will see the installed version.

---

# 2. Install Terraform

Once Homebrew is installed, installing Terraform only takes one command.

Run the following command in **Terminal**:

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

---

# 3. Verify the Installation

After installation, check that Terraform works correctly:

```bash
terraform -version
```

You should see output similar to:

```
Terraform v1.x.x
```

---

# 4. Update Terraform

To update Terraform to the latest version later:

```bash
brew upgrade hashicorp/tap/terraform
```

---

# 5. Test Terraform

Create a test directory and run Terraform:

```bash
mkdir terraform-test
cd terraform-test
terraform init
```

If Terraform initializes successfully, the installation works.

---

# Troubleshooting

### Command not found: brew

Homebrew is not installed or not added to your PATH. Reinstall Homebrew or restart the terminal.

### Terraform command not found

Try restarting the terminal or verifying the installation with:

```bash
brew list terraform
```

---

# Additional Resources

* Terraform documentation: [https://developer.hashicorp.com/terraform/docs](https://developer.hashicorp.com/terraform/docs)
* Terraform tutorials: [https://developer.hashicorp.com/terraform/tutorials](https://developer.hashicorp.com/terraform/tutorials)

---

# Summary

Steps to install Terraform on macOS:

1. Install **Homebrew**
2. Install **Terraform** using Homebrew
3. Verify the installation with `terraform -version`
4. Run `terraform init` to test the installation

You are now ready to start using Terraform.