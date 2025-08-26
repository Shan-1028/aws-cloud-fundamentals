# 🌐 S3 Hands-on Project

This project demonstrates how to **host a static website on Amazon S3**.

---

## 📝 Steps

### 1. Create an S3 Bucket
- Go to **AWS Management Console → S3 → Create bucket**
- Bucket name must be **unique globally** (e.g., `my-s3-hands-on-demo`)
- Choose your region
- **Uncheck Block all public access** → confirm
- Keep other settings default

### 2. Upload Files
- Upload [`index.html`](./index.html) to the bucket

### 3. Enable Static Website Hosting
- Go to **Properties → Static website hosting**
- Enable → Choose “Host a static website”
- Set:
  - **Index document:** `index.html`

### 4. Set Bucket Policy (Public Read)
Go to **Permissions → Bucket Policy**, and paste (replace `your-bucket-name`):

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::your-bucket-name/*"
    }
  ]
}
