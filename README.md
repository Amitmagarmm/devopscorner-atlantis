# Atlantis DCI (DevOpsCorner Indonesia) Terraform

Centralized IaC Tools Provisioning using Terraform

[![ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/devopscorner/devopscorner-atlantis)
![all contributors](https://img.shields.io/github/contributors/devopscorner/devopscorner-atlantis)
![tags](https://img.shields.io/github/v/tag/devopscorner/devopscorner-atlantis?sort=semver)
![view](https://views.whatilearened.today/views/github/devopscorner/devopscorner-atlantis.svg)
![issues](https://img.shields.io/github/issues/devopscorner/devopscorner-atlantis)
![pull requests](https://img.shields.io/github/issues-pr/devopscorner/devopscorner-atlantis)
![forks](https://img.shields.io/github/forks/devopscorner/devopscorner-atlantis)
![stars](https://img.shields.io/github/stars/devopscorner/devopscorner-atlantis)
[![license](https://img.shields.io/github/license/devopscorner/devopscorner-atlantis)](https://img.shields.io/github/license/devopscorner/devopscorner-atlantis)

---

## Available Tags

### Alpine v3.22

| Image name | Size |
|------------|------|
| `devopscorner/devopscorner-atlantis:latest` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/latest.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=latest) ![default-latest](https://img.shields.io/static/v1?label=latest&message=default&color=brightgreen) ![latest](https://img.shields.io/static/v1?label=latest&message=alpine&color=orange) |
| `devopscorner/devopscorner-atlantis:alpine` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/alpine.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=alpine) ![latest](https://img.shields.io/static/v1?label=latest&message=alpine&color=orange) |
| `devopscorner/devopscorner-atlantis:alpine-latest` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/alpine-latest.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=alpine-latest) |

### Debian Bookworm

| Image name | Size |
|------------|------|
| `devopscorner/devopscorner-atlantis:debian` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/debian.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=debian) ![latest](https://img.shields.io/static/v1?label=latest&message=debian&color=orange) |
| `devopscorner/devopscorner-atlantis:debian-latest` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/debian-latest.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=debian-latest) |

### AWS Linux

| Image name | Size |
|------------|------|
| `devopscorner/devopscorner-atlantis:aws` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/aws.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=aws) ![latest](https://img.shields.io/static/v1?label=latest&message=aws&color=orange) |
| `devopscorner/devopscorner-atlantis:aws-latest` | [![docker image size](https://img.shields.io/docker/image-size/devopscorner/devopscorner-atlantis/aws-latest.svg?label=Image%20size&logo=docker)](https://hub.docker.com/repository/docker/devopscorner/devopscorner-atlantis/tags?page=1&ordering=last_updated&name=aws-latest) |

---

## Prerequirements

- Docker (`docker`)
- Docker Compose (`docker-compose`)

---

## AWS Control Tower

<div align="center">
    <img src="./docs/assets/ct-ou.svg" width="800px">
</div>


## AWS Organization

```
.
├── DCI-Management
│   ├── devopscorner-ct-log        (123456789012 | ct.logs@devopscorner.id)
│   ├── devopscorner-ct-management (112233445566 | ct.management@devopscorner.id)
│   └── devopscorner-ct-audit      (111122223333 | ct.audit@devopscorner.id)
└── DCI-OrganizationUnit
    ├── DCI-Billing
    │   └── devopscorner-billing   (444455556666 | ou.billing@devopscorner.id)
    ├── devopscorner-dev01         (098765432101 | dev01@devopscorner.id)
    ├── devopscorner-dev02         (555566667777 | dev02@devopscorner.id)
    ├── devopscorner-uat01         (888899990000 | uat01@devopscorner.id)
    ├── devopscorner-uat02         (123123123123 | uat02@devopscorner.id)
    ├── devopscorner-prod01        (456456456456 | prod01@devopscorner.id)
    └── devopscorner-prod02        (789789789789 | prod02@devopscorner.id)
```

## Terraform Centralized Provisioning

<div align="center">
    <img src="./docs/assets/tf-provisioning.svg" width="800px">
</div>

## Terraform Structure

```
tree -L 3    # three-levels show
---
.
├── atlantis.yaml
├── aws-session.sh
├── builder
│   ├── atlantis-nginx-basic-auth.conf
│   ├── atlantis-nginx.conf
│   ├── atlantis-v4.25.2.yaml
│   ├── ATLANTIS-WORKSPACE.md
│   ├── config
│   │   ├── docker
│   │   └── k8s
│   ├── docker-compose.yml
│   ├── Dockerfile
│   ├── dockerhub-build.sh
│   ├── dockerhub-push.sh
│   ├── dockerhub-tag.sh
│   ├── ecr-build.sh
│   ├── ecr-pull.sh
│   ├── ecr-push.sh
│   ├── ecr-tag.sh
│   ├── git-clone.sh
│   ├── HOW-TO.md
│   ├── repo-v4.25.2.yaml
│   └── scripts
│       ├── atlantis-deploy
│       ├── init-atlantis
│       ├── install-atlantis-deploy
│       └── setup-basic-auth
├── docs
│   └── assets
│       ├── architecture-devopscorner-awscb.drawio
│       ├── ct-billing.svg
│       ├── ct-ou.svg
│       ├── ct.svg
│       └── tf-provisioning.svg
├── environments
│   ├── dev
│   │   ├── devopscorner-dev01
│   │   └── devopscorner-dev02
│   ├── prod
│   │   ├── devopscorner-prod01
│   │   └── devopscorner-prod02
│   └── uat
│       ├── devopscorner-uat01
│       └── devopscorner-uat02
├── gen-docs.sh
├── helm
│   ├── atlantis
│   └── jumppod
│       ├── backend
│       └── stateful
├── LICENSE
├── manifest
│   ├── credentials-config.txt
│   ├── csi-driver
│   ├── eks-manifest
│   ├── helm-value-atlantis-nfs-v4.25.2.yaml
│   ├── helm-value-jumppod-nfs.yaml
│   ├── manifest-configmap-atlantis-aws-config.yaml
│   ├── manifest-configmap-atlantis-aws-credentials.yaml
│   ├── manifest-configmap-atlantis-config.yaml
│   ├── manifest-configmap-atlantis-tf-config.yaml
│   ├── manifest-configmap-atlantis.yaml
│   ├── manifest-secretref-atlantis-aws.yaml
│   ├── manifest-secretref-atlantis-gh-vcs.yaml
│   ├── manifest-storage-class-aws copy.yaml
│   ├── manifest-storage-class-aws.yaml
│   └── secret
│       ├── aws-auth.txt
│       └── manifest-secret-http-auth.yaml
├── modules
│   ├── budget
│   ├── core-igw
│   ├── core-igw-ec2
│   ├── core-igw-eks
│   ├── core-nat
│   ├── core-nat-ec2
│   ├── core-nat-eks
│   ├── eks
│   ├── iam-tfuser-executor
│   ├── iam-user
│   ├── scheduler
│   │   ├── scheduler-config
│   │   ├── scheduler-core
│   │   └── scheduler-notifications
│   ├── storage-efs
│   ├── storage-s3
│   └── tfstate
├── README.md
└── scripts
    ├── csi-driver.sh
    └── nfs-subdir.sh

49 directories, 252 files
```

## Copyright

- Author: **DevOps Engineer (support@devopscorner.id)**
- Vendor: **DevOpsCorner Indonesia (devopscorner.id)**
- License: **Apache v2**
