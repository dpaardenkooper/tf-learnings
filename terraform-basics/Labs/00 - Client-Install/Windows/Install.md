# Installing Terraform on Windows

This guide explains how to install **Terraform** on a **Windows system** so you can use it during the course.

---

# Prerequisites

Before installing Terraform, make sure you have:

* A **Windows 10 or Windows 11** system
* Permission to install software
* Access to **PowerShell** or **Command Prompt**
* Internet access to download Terraform

---

# 1. Download Terraform

1. Open your browser.

2. Go to the official Terraform download page:

   [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)

3. Download the **Windows (AMD64)** zip file.

The downloaded file will look similar to:

```
terraform_<version>_windows_amd64.zip
```

Example:

```
terraform_1.7.5_windows_amd64.zip
```

---

# 2. Extract the ZIP File

1. Navigate to your **Downloads** folder.
2. Right-click the downloaded **Terraform ZIP file**.
3. Click **Extract All**.
4. Extract the file to a folder such as:

```
C:\terraform
```

After extracting, the folder should contain:

```
terraform.exe
```

---

# 3. Add Terraform to the System PATH

To use Terraform from anywhere in the terminal, you must add it to your **PATH**.

1. Press **Start**
2. Search for **Environment Variables**
3. Click **Edit the system environment variables**
4. Click **Environment Variables**
5. Under **System Variables**, find and select **Path**
6. Click **Edit**
7. Click **New**
8. Add the folder where Terraform is located:

```
C:\terraform
```

9. Click **OK** to save all windows.

---

# 4. Verify the Installation

Open a new **PowerShell** or **Command Prompt** window and run:

```bash
terraform -version
```

You should see output similar to:

```
Terraform v1.x.x
```

If you see this message, Terraform is installed successfully.

---

# 5. Test Terraform

Create a test directory and initialize Terraform:

```bash
mkdir terraform-test
cd terraform-test
terraform init
```

If Terraform runs without errors, the installation works.

---

# Troubleshooting

### Terraform is not recognized as a command

If you see:

```
terraform : The term 'terraform' is not recognized
```

Try the following:

* Close and reopen your terminal
* Verify the **PATH** variable contains `C:\terraform`
* Make sure `terraform.exe` exists in that folder

---

# Updating Terraform

To update Terraform:

1. Download the latest version from the Terraform website
2. Replace the existing `terraform.exe` file in `C:\terraform`

---

# Additional Resources

Terraform Documentation:

[https://developer.hashicorp.com/terraform/docs](https://developer.hashicorp.com/terraform/docs)

Terraform Tutorials:

[https://developer.hashicorp.com/terraform/tutorials](https://developer.hashicorp.com/terraform/tutorials)

---

# Summary

Steps to install Terraform on Windows:

1. Download Terraform from the official website
2. Extract the ZIP file
3. Place `terraform.exe` in `C:\terraform`
4. Add the folder to the **PATH**
5. Verify installation with `terraform -version`

You are now ready to start using Terraform.
