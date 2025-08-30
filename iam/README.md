# 🚀 AWS IAM Project – Secure IAM Setup

This project demonstrates how to create a **secure IAM configuration** in AWS with **Users, Groups, Policies, and Roles**.

---

## 📌 Objective
- Implement Least Privilege Access
- Separate Admin, Developer, and Auditor responsibilities
- Securely allow EC2 instances to access S3 without credentials

---

### 🔍 How to Check if AWS CLI is Configured
1. Verify AWS CLI Installation
aws --version


If installed → returns version (e.g., aws-cli/2.15.0).

If not installed → follow AWS CLI installation guide
.

2. Check Active Configuration
aws configure list


Shows the active profile, access key, region, and output format.

If unconfigured → credentials show as None.

3. List All Profiles
aws configure list-profiles   # (AWS CLI v2)


Or manually check config files:

cat ~/.aws/config        # Regions & output formats
cat ~/.aws/credentials   # Access keys (⚠️ keep secret!)

4. Test with a Simple Command
aws sts get-caller-identity


### ✅ Success → Returns AWS account ID, user ARN, and identity info.

### ❌ Failure → Errors like Unable to locate credentials mean it’s not configured.

5. Next Steps if Not Configured

Run:

aws configure


→ Provide Access Key ID, Secret Key, Default region, and Output format.


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
