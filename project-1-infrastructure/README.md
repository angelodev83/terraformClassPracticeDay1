# My First Infrastructure as Code Project

This project creates a simple web application on Azure using Terraform, demonstrating Infrastructure as Code (IaC) principles.

## 🎯 What This Creates

- **Application on nodejs** - this runs an containarized docker nodejs app on Azure using terraform
- **Pulls image from ACR automatically** - 

- **Public IP Address** - application must be on IP:3000 port
- **Remote tfstate** - tfstate must be placed remotely

## 📋 Prerequisites

Before starting, ensure you have:

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed
- An Azure account ([free tier](https://azure.microsoft.com/free/) works perfectly!)
- Basic knowledge of command line operations

## 📁 Project Structure

```
my-first-infrastructure/
├── main.tf              # Main Terraform configuration
├── variables.tf         # Variable definitions
├── terraform.tfvars     # Variable values (customize this!)
├── outputs.tf
package.json
index.js
           # Output definitions
└── README.md           # This file
```

## 🚀 Step-by-Step Deployment

### 1. Initial Setup

```bash
# Clone or download this project
git clone <repository-url>
cd project-1-infrastructure

# Login to Azure
az login
# Follow the browser prompts to complete authentication
```

### 2. Customize Your Deployment

Edit tf scripts to personalize your deployment using the resources from the first deployment.( resource group and ACR)

```hcl
# Example terraform.tfvars
resource_group_name = "rg-yourname-devops"
location           = "East US"
container_name     = "my-webapp"
```

after you have the scripts ready, build the docker image locally and push it to acr:

After you create container registry log in:

# Login to ACR
az acr login --name myacr12345

# Build and tag image
docker build -t myacr12345.azurecr.io/my-node-app:v1 .

# Push image
docker push myacr12345.azurecr.io/my-node-app:v1

type acr credentials in terraform.tfvars:

fetch credentials running this command:
az acr credential show --name myacr --resource-group myresourcegroup

Now your app will be able to pull image from ACR.

check syntax using "terraform validate"

### 3. Deploy Infrastructure

```bash
# Initialize Terraform (download providers)
terraform init

# Preview what will be created
terraform plan

# Create the infrastructure
terraform apply
# Type 'yes' when prompted
```

### 4. Access Your Application

After deployment completes:

```bash
# Get your application's public IP
terraform output container_ip

# Open in browser
# http://YOUR_IP_ADDRESS:3000
```

## to store you tfstate remotely follow these steps:

1. Edit backend script with your workflow data.
2. Initialize backend with: terraform init -reconfigure
3. run "terraform plan" and "terraform apply"
4. run "terraform pull" to check state



## 🧹 Cleanup

To avoid ongoing charges, destroy resources when done:

```bash
terraform destroy
# Type 'yes' when prompted
```

## 🔧 Troubleshooting

### Common Issues and Solutions

#### ❌ "Command not found" Errors

```bash
az: command not found
terraform: command not found
```

**Solution:**
- Reinstall Azure CLI and Terraform
- Restart your terminal
- Verify installation: `az --version` and `terraform --version`

#### ❌ Docker Registry Error (409 Conflict)

```bash
RegistryErrorResponse: An error response is received from the docker registry
```

**Solution:**
- Wait 10-15 minutes and retry `terraform apply`
- This is a temporary Docker Hub rate limit issue

#### ❌ Resource Group Already Exists

```bash
Error: A resource group with the name 'rg-john-devops' already exists
```

**Solution:**
- Change `resource_group_name` in `terraform.tfvars` to something unique
- Re-run `terraform apply`

#### ❌ Authentication Failed

**Solution:**
```bash
az login
az account show  # Verify you're logged in
terraform apply
```
Configure credentials using Azure SP. 
export crendentials.
(if you need help with credentials ask teacher)

#### ❌ Can't Access the Website

**Troubleshooting steps:**

1. **Check container status:**
   ```bash
   az container show --resource-group <your-rg-name> --name <your-container-name> --query "instanceView.state"
   ```

2. **Get current IP:**
   ```bash
   terraform output container_ip
   ```

3. **Check container logs:**
   ```bash
   az container logs --resource-group <your-rg-name> --name <your-container-name>
   ```

#### ❌ Insufficient Permissions

**Solution:**
- Use a personal Azure subscription if possible
- Try a different region in `terraform.tfvars`:
  ```hcl
  location = "West US"
  ```

## 📚 What You've Learned

By completing this project, you've:

- ✅ Used Infrastructure as Code (Terraform)
- ✅ Created cloud resources programmatically
- ✅ Deployed a containerized application
-    Pull docker image from ACR
-    Build nodejs application
-    Store tfstate remotely

- ✅ Managed cloud infrastructure lifecycle
- ✅ Practiced DevOps fundamentals

## 🔗 Next Steps

- Explore more Terraform providers


## 📞 Support

If you encounter issues not covered here:
1. Check the [Terraform Azure Provider docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
2. Review [Azure Container Instances documentation](https://docs.microsoft.com/en-us/azure/container-instances/)
3. Search existing issues on the project repository

---

**Happy Infrastructure Building! 🎉**