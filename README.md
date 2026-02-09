# DevOps Intern Assignment – 8byte

## Project Overview

This project is done as part of the DevOps Intern technical assignment.  
The goal of this project is to deploy a simple Node.js application on AWS using Docker, Terraform, and GitHub Actions.

In this project:
- Infrastructure is created using Terraform
- Application is containerized using Docker
- Application is deployed on AWS EC2
- CI pipeline is implemented using GitHub Actions

---

## Tech Stack Used

- Cloud Provider: AWS
- Infrastructure as Code: Terraform
- Containerization: Docker
- CI/CD: GitHub Actions
- Application: Node.js (Express)
- OS: Ubuntu 22.04

---

## Application Details

The application is a simple Node.js Express app that runs on port **3000** and displays a success message when accessed from the browser.

---

## Run Application Locally

```bash
npm install
node app.js
```
---

Open browser:

http://localhost:3000

## Docker Setup

Docker installed using terraform user_data
Build Docker Image
```bash
docker build -t 8byte-intern-app .
```
---

Run Docker 
```bash
docker run -d -p 3000:3000 8byte-intern-app
```

Application will be available at:

http://localhost:3000

## Infrastructure Provisioning using Terraform

Terraform is used to create the following AWS resources:
-VPC
-Public Subnet
-Internet Gateway
--Route Table and Route Table Association
-Security Group (ports 22 and 3000)
-EC2 Instance with Docker installed using user_data
```bash
Terraform Commands
terraform init
terraform plan
terraform apply
```
---

After apply, EC2 public IP is generated.
Deploy Application on EC2
Steps followed after EC2 creation:
## Login to EC2 using SSH 
```bash
ssh - 8byte-intern.pem ubuntu@16.16.220.60
```
---
Verify Docker installation
```bash
docker ps
```
---
Clone GitHub repository
```bash
git clone https://github.com/BabuLahade/8byte-intern.git
```
---
Build Docker image
```bash
docker build -t 8byte-intern-app .
---
Run Docker container
```bash
docker run -d -p 3000:3000 8byte-intern-app
```

## Application is accessible using:

http://16.16.220.60:3000

## CI/CD using GitHub Actions

GitHub Actions is used to automate Docker image build.
Workflow details:
-Triggered on push to main branch
-Runs on Ubuntu runne
-Builds Docker image to verify Dockerfile and application
-This ensures that any code pushed to main branch is automatically validated.

## Screenshots

The following screenshots are included:

Terraform apply output
![Terraform](screenshots/8byte%20terraform%20apply%201.png)
![Terraform](screenshots/8byte%20terraform%20apply.png)


EC2 instance running
![instance](screenshots/8byte%20docker%20build.png)
Application running in browser
![app](screenshots/8byte%20ec2%20public%20ip%20running%20app.png)
GitHub Actions pipeline success
![Github](screenshots/8byte%20github%20actions.png)

