# 🚀 EC2 Hands-on Project

This project demonstrates how to **launch an EC2 instance, install Nginx, and host a simple webpage** using User Data.

---

## 📝 Steps

### 1. Launch an EC2 Instance
- Go to **AWS Management Console → EC2 → Launch Instance**
- Choose **Amazon Linux 2 AMI**
- Select **t2.micro (Free Tier)**
- Configure:
  - **Key Pair** → create/download one (for SSH access)
  - **Security Group** → allow **SSH (22)** and **HTTP (80)**
- Add the **User Data script** from [`user-data.sh`](./user-data.sh)

### 2. Connect to the Instance
```bash
ssh -i your-key.pem ec2-user@<EC2-Public-IP>
