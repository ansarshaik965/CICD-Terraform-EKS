```markdown
# CICD-Terraform-EKS

This repository contains the code for deploying an Amazon EKS (Elastic Kubernetes Service) cluster using Terraform. The deployment process involves setting up an EC2 instance to run Jenkins, which then automates the creation and management of the EKS cluster through a CI/CD pipeline.

## Repository Structure

- `EKS/`: Contains the Terraform files needed to create the EKS cluster.
- `jenkins-server/`: Contains the Terraform files needed to set up an EC2 instance that runs Jenkins.

## Deployment Steps

### 1. Prerequisites

Before starting the deployment, ensure you have the following:

- An AWS Account
- AWS Root Account Access Keys

#### Generating Root Account Access Keys

To generate root account access keys for the AWS CLI:

1. Sign in to the AWS Management Console as the root user.
2. Navigate to the IAM (Identity and Access Management) service.
3. In the navigation pane, choose "Users" and then select your root user.
4. Choose the "Security credentials" tab, and then under "Access keys for CLI, SDK, & API access," choose "Create access key."
5. Download the .csv file to store your access key ID and secret access key.

### 2. Deploy EC2 Instance for Jenkins

The first step is to deploy an EC2 instance that will run Jenkins. This instance will have user data that installs Terraform, kubectl, Jenkins, and the AWS CLI.

1. Navigate to the `jenkins-server` directory.
2. Initialize and apply the Terraform configuration:
   ```bash
   terraform init
   terraform apply
   ```

### 3. Configure Jenkins and Deploy EKS Cluster

Once the EC2 instance is up and running, connect to it via SSH and configure Jenkins to automate the deployment of the EKS cluster.

1. SSH into the EC2 instance:
   ```bash
   ssh -i path/to/your-key.pem ec2-user@your-ec2-instance-public-dns
   ```
2. Open Jenkins and create a new pipeline job for deploying the EKS cluster.
3. Use the `Jenkinsfile` provided in the repository to automate the deployment.
4. After the EKS cluster is created, update the `kube-config` file to connect to the cluster:
   ```bash
   aws eks --region region-code update-kubeconfig --name cluster-name
   ```

### 4. Deploy NGINX on EKS Cluster

With the EKS cluster up and running, you can deploy an NGINX application to the cluster using a Jenkins pipeline.

1. Create a new Jenkins pipeline job for the deployment stage.
2. Use the provided `Jenkinsfile` to deploy NGINX on the EKS cluster.

## Conclusion

This setup provides a robust CI/CD pipeline for managing an EKS cluster using Terraform and Jenkins. By following the steps outlined above, you can automate the deployment and management of your Kubernetes clusters on AWS.

## Author

Ansar Shaik

For any queries, please contact me at [ansarshaik965@gmail.com](mailto:ansarshaik965@gmail.com).
```
