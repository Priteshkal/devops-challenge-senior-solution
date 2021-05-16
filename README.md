# Particle41 DevOps Challange - Senior level

This is a senior-level challenge for candidates who want to join the Particle41 DevOps team.

It is designed to test your level of familiarity with development and operations tools and concepts.

You will have **8 hours** to complete the challenge.


## The challenge

You must use either Terraform, AWS CloudFormation, AWS CDK, or Pulumi for all of the following tasks.

- Create code for deploying a VPC in AWS with 2 public and 2 private subnets.

- Create code for deploying an EKS cluster in AWS, which will use the VPC created in the previous step. The cluster must have 2 nodes, using instance type `t3a.large`. The nodes must be on the private subnets only.

- Add a `README.md` to the root directory of your project, with instructions for the team to deploy the infrastructure you created.

- Publish your code to a public Git repository in a platform of your choice (e.g. GitHub, GitLab, Bitbucket, etc.), so that it can be cloned by the team.


## Criteria


Your task will be considered successful if a colleague is able to deploy your infrastructure to an AWS account.

Imagine that someone with less experience than you will need to clone your repository and deploy your infrastructure. With that in mind, you must provide all the instructions they will need to do that successfully. These must include any prerequisites for deployment; mention of needed tools and links to their installation pages; how to configure credentials for the tool of your choice; and what commands to run for deploying your code to AWS.

We want to see your ability to properly document and communicate about your work with the team.

Other criteria for evaluation will be:

- Code quality and style: your code must be easy for others to read, and properly documented when relevant


# SOLUTION


## Toolchain Setup for macOS

### Operating System Version

This documentation is written for macOS High Sierra. If you are running
an older version, it is recommended to upgrade before proceeding. Use
this [Apple Support KB](https://support.apple.com/en-us/HT201260) to
identify and verify the macOS version you are using.

### Homebrew

We will use [Homebrew](https://brew.sh/) for managing installation of
other tools.

``` shell
# Run the official Homebrew installer
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Get Homebrew-Cask
brew tap caskroom/cask

# Update Homebrew
brew update
```

## Install Tools

We need Git, Terraform and AWS CLI installed and configured to deploy infrastructure in AWS using Terraform.

``` shell
# GIT
# https://git-scm.com/download/mac
brew install git

# Terraform
# https://formulae.brew.sh/formula/terraform
brew install terraform

# Test to ensure latest version of Terraform 0.15
terraform --version

# AWS CLI
# https://formulae.brew.sh/formula/awscli#default
brew install awscli
```

[Configure AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

```shell
aws configure

AWS Access Key ID [None]: <Your AWS Access Key ID - Ask your administrator>
AWS Secret Access Key [None]: <Your AWS Secret Access Key - Ask your administrator>
Default region name [None]: us-east-1
Default output format [None]: json
```

Clone this repo. 

``` shell
# Open terminal
git clone https://github.com/Priteshkal/devops-challenge-senior-solution.git

cd devops-challenge-senior-solution
```

## POST SETUP

Once all the above tools are set up you are ready to deploy an EKS Cluster and supporting infrastructure to AWS with following features after deploying it using the following command in the terminal:

```shell

# Terraform Initialize and Downloading all the necessary providers
terraform init

# Terraform plan which shows all the infrastructure that will be deployed
terraform plan

# Terraform apply which will deploy all the necessary infrastructure on AWS
terraform apply

```

### Features

- Code to deploy a VPC (10.0.0.0/16) in AWS with 2 public (10.0.0.0/24 & 10.0.1.0/24) and 2 private (10.0.100.0/24 & 10.0.101.0/24) subnets .

- Code to deploy an EKS cluster in AWS, which will use the VPC created in the previous step. The cluster has 2 nodes, with instance type `t3a.large`. The nodes must be on the private subnets only.

- Added a `README.md` to the root directory of your project, with instructions for the team to deploy the infrastructure you created.

- Code published to a public [Git repository](https://github.com/Priteshkal/devops-challenge-senior-solution.git)in GitHub.
