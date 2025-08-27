# 🚀 AWS IAM Project – Secure IAM Setup

This project demonstrates how to create a **secure IAM configuration** in AWS with **Users, Groups, Policies, and Roles**.

---

## 📌 Objective
- Implement Least Privilege Access
- Separate Admin, Developer, and Auditor responsibilities
- Securely allow EC2 instances to access S3 without credentials

---

## 🛠️ Steps

### 1. Create IAM Groups
- **Admins** → Full AWS Access
- **Developers** → S3 + CloudWatch Logs only
- **Auditors** → Read-only Access

### 2. Attach Policies
- Admins → `AdministratorAccess`
- Developers → `DeveloperPolicy` (custom)
- Auditors → `ReadOnlyAccess`

### 3. Create IAM Users
- Alice → Admins
- Bob → Developers
- Charlie → Auditors

### 4. Create IAM Role for EC2
- Role: `EC2WebAppRole`
- Policy: Allow S3 Read-only
- Trust Policy: EC2 can assume role

---

## 📂 Policies

- **policies/developer-policy.json**
- **policies/s3-read-policy.json**
- **policies/trust-policy.json**

---

## ▶️ Quick Setup

Run the setup script:

```bash
bash scripts/setup-iam.sh
```
