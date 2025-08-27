#!/bin/bash
# 🚀 IAM Setup Script

# 1. Create Groups
aws iam create-group --group-name Admins
aws iam create-group --group-name Developers
aws iam create-group --group-name Auditors

# 2. Attach Policies
aws iam attach-group-policy --group-name Admins --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
aws iam attach-group-policy --group-name Auditors --policy-arn arn:aws:iam::aws:policy/ReadOnlyAccess

# Developer Policy
DEV_POLICY_ARN=$(aws iam create-policy --policy-name DeveloperPolicy \
  --policy-document file://policies/developer-policy.json \
  --query 'Policy.Arn' --output text)

aws iam attach-group-policy --group-name Developers --policy-arn $DEV_POLICY_ARN

# 3. Create Users
aws iam create-user --user-name Alice
aws iam create-user --user-name Bob
aws iam create-user --user-name Charlie

aws iam add-user-to-group --user-name Alice --group-name Admins
aws iam add-user-to-group --user-name Bob --group-name Developers
aws iam add-user-to-group --user-name Charlie --group-name Auditors

# 4. Create EC2 Role
aws iam create-role --role-name EC2WebAppRole \
  --assume-role-policy-document file://policies/trust-policy.json

aws iam put-role-policy --role-name EC2WebAppRole \
  --policy-name S3ReadPolicy \
  --policy-document file://policies/s3-read-policy.json
