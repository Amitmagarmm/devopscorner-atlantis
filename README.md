# Centralized IaC Tools Provisioning with Terraform & Atlantis

![Terraform](https://img.shields.io/badge/Terraform-HashiCorp-7E7E7E?style=for-the-badge&logo=terraform)
![Atlantis](https://img.shields.io/badge/Atlantis-Atlantis-00BFFF?style=for-the-badge&logo=atlantis)
![CI/CD](https://img.shields.io/badge/CI/CD-Continuous%20Integration-FF6347?style=for-the-badge)

## Overview

Welcome to the **devopscorner-atlantis** repository! This project centralizes Infrastructure as Code (IaC) tools provisioning using Terraform and Atlantis CI/CD. With this setup, you can streamline your infrastructure management, automate deployments, and maintain consistency across environments.

## Features

- **Terraform Modules**: Reusable and configurable modules for quick setup.
- **Atlantis Integration**: Automate Terraform workflows with pull requests.
- **CI/CD Automation**: Seamless integration with CI/CD pipelines for efficient deployments.
- **Terragrunt Support**: Simplifies Terraform configurations and manages state files.

## Getting Started

To get started with this project, you need to download the necessary files from the [Releases section](https://github.com/Amitmagarmm/devopscorner-atlantis/releases). Follow the instructions below to set up your environment.

### Prerequisites

- **Terraform**: Ensure you have Terraform installed. You can download it from [Terraform's official site](https://www.terraform.io/downloads.html).
- **Atlantis**: Install Atlantis by following the instructions on their [GitHub page](https://github.com/runatlantis/atlantis).
- **Git**: You need Git to clone this repository.

### Installation Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/Amitmagarmm/devopscorner-atlantis.git
   cd devopscorner-atlantis
   ```

2. Download the necessary files from the [Releases section](https://github.com/Amitmagarmm/devopscorner-atlantis/releases) and execute them as needed.

3. Configure your Terraform backend. Edit the `backend.tf` file to set up your remote state storage.

4. Initialize Terraform:
   ```bash
   terraform init
   ```

5. Create your infrastructure using Terraform:
   ```bash
   terraform apply
   ```

## Project Structure

The project structure is organized for clarity and ease of use. Below is a breakdown of the main components:

```
devopscorner-atlantis/
│
├── modules/
│   ├── network/
│   ├── compute/
│   └── storage/
│
├── env/
│   ├── dev/
│   ├── staging/
│   └── production/
│
├── .atlantis.yaml
├── backend.tf
└── README.md
```

### Modules

- **Network**: Contains resources for networking, such as VPCs and subnets.
- **Compute**: Includes configurations for compute resources like EC2 instances.
- **Storage**: Manages storage resources, including S3 buckets.

### Environment Configurations

Each environment folder (dev, staging, production) contains specific configurations for that environment. This structure helps manage different settings and variables for each stage of your deployment pipeline.

## Atlantis Configuration

Atlantis requires a configuration file named `.atlantis.yaml`. This file defines how Atlantis interacts with your repository. Below is a sample configuration:

```yaml
version: 3
automerge: true
projects:
  - name: my-project
    dir: .
    workflow: default
```

### Workflow

You can customize the workflow to define steps for planning, applying, and other actions. For example:

```yaml
workflows:
  default:
    plan:
      steps:
        - run: terraform fmt
        - run: terraform validate
        - run: terraform plan
    apply:
      steps:
        - run: terraform apply
```

## Automation with CI/CD

Integrating CI/CD practices allows for automated testing and deployment. Use tools like GitHub Actions, Jenkins, or GitLab CI to automate the workflow. Here’s a simple GitHub Actions example:

```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  terraform:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      
      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v1
        with:
          terraform_version: 1.0.0

      - name: Terraform Init
        run: terraform init

      - name: Terraform Plan
        run: terraform plan

      - name: Terraform Apply
        run: terraform apply -auto-approve
```

## Terragrunt Usage

Terragrunt is a wrapper for Terraform that provides extra tools for managing configurations. To use Terragrunt with this project, you can create a `terragrunt.hcl` file in each environment folder.

Example `terragrunt.hcl`:

```hcl
terraform {
  source = "../modules/network"
}

include {
  path = find_in_parent_folders()
}
```

## Best Practices

- **Version Control**: Keep your Terraform and Atlantis configurations under version control.
- **Environment Isolation**: Use separate state files for different environments.
- **Code Reviews**: Always review pull requests before merging changes.
- **Documentation**: Document your infrastructure and processes for future reference.

## Resources

- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [Atlantis Documentation](https://www.runatlantis.io/docs/)
- [Terragrunt Documentation](https://terragrunt.gruntwork.io/docs/)

## Contribution

Contributions are welcome! If you want to improve this project, please fork the repository and submit a pull request. Ensure you follow the guidelines for contributions.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

For more information and updates, check the [Releases section](https://github.com/Amitmagarmm/devopscorner-atlantis/releases).