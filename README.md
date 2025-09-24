# Antique Cafe Website ☕

Automated deployment of a **highly available web application** for the Antique Cafe Website using **Terraform** and AWS cloud services. The infrastructure is provisioned with modular Terraform code, ensuring scalability, high availability, and ease of collaboration with remote state management.  

---

## 🚀 Project Overview
- Automated deployment of a **highly available website** using Terraform.  
- Infrastructure includes **VPC, Subnets, NAT Gateway, Internet Gateway, and Security Groups**.  
- Modular setup with **Auto Scaling Groups (ASG)**, **Elastic Load Balancer (ELB)**, and **RDS** for database management.  
- EC2 instances configured with managed access via **Key Pairs**.  
- Terraform backend configured with **S3 remote state** to enable **team collaboration** and **state locking**.  

---

## 🏗️ Infrastructure Components
- **VPC** – Custom Virtual Private Cloud with public & private subnets.  
- **Subnets** – Separate public and private subnets across multiple Availability Zones.  
- **NAT Gateway** – For secure outbound traffic from private subnets.  
- **Security Groups** – Fine-grained access control for EC2, RDS, and ELB.  
- **Auto Scaling Group (ASG)** – Ensures high availability by scaling EC2 instances.  
- **Elastic Load Balancer (ELB)** – Distributes traffic across EC2 instances.  
- **Amazon RDS** – Managed relational database for application data.  
- **EC2 Instances** – Hosts the web application.  
- **S3 Backend** – Remote backend for Terraform state management.  

---

## ⚙️ Technologies Used
- **Terraform**  
- **AWS VPC**  
- **Auto Scaling Group (ASG)**  
- **Elastic Load Balancer (ELB)**  
- **Amazon RDS**  
- **Amazon EC2**  
- **Amazon S3**  

---


---

## 🔑 Prerequisites
- Terraform installed (`>= 1.5.x`)  
- AWS CLI configured with proper IAM credentials  
- S3 bucket for remote backend  
- Key pair created in AWS for EC2 access  

---

## 🛠️ Deployment Steps
1. **Clone the repository**  
   ```bash
   git clone https://github.com/your-username/antique-cafe-website.git
   cd antique-cafe-website
   ```

2. **Initialize Terraform**
   ```bash
   terraform init
   ```

3. **Generates an execution plan**
   ```bash
   terraform plan
   ```

4. **Apply the changes**
   ```bash
   terraform apply
   ```

5. **Destroy after completion**
   ```bash
   terraform destroy
   ```


## 👥 Team Collaboration

Remote backend is configured with **Amazon S3** for storing the Terraform state.  
Team members can safely work together without overwriting each other's changes.
   
5. 
4. 
