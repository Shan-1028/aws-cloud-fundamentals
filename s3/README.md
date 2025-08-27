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
```
### 🔹 What the Bucket Policy Does

- That JSON bucket policy is basically saying:
- Effect: Allow → We are granting permissions.
- Principal: * → Everyone (public, not just your AWS account).
- Action: s3:GetObject → The only thing people can do is read (download) objects.
- Resource: arn:aws:s3:::your-bucket-name/* → Applies to all files inside the bucket.

###  👉 So the policy is making your files publicly accessible (for example, so that if you host a website on S3, visitors can open https://your-bucket-name.s3.amazonaws.com/index.html in their browser).

### 🔹 What Happens If You Don’t Add This Policy

- Your files will still exist in the bucket, but only your AWS account (or IAM roles with permission) can access them.
- If you try to open index.html from the bucket link, you’ll get an Access Denied error.
- This means your S3 site won’t work for users → because browsers won’t be able to fetch files.

### 🔹 Why You Uncheck "Block All Public Access"

- By default, S3 blocks all public access (this is a security feature, to prevent people from accidentally exposing private data).
- When hosting a static website, though, you need to make the files public because:
- Visitors need to read/download HTML, CSS, JS, images.
- Without this, only you (the owner) could see the content.

So:

✅ Uncheck "Block all public access" → allows bucket to have public permissions.
✅ Add bucket policy → defines exactly what public users can do (in this case, only read files, nothing else).

### ⚠️ Security Note

- You should only make public-read if your bucket is serving a website or public assets.
- For private files (e.g., backups, logs), never use public-read. Instead, use IAM roles or signed URLs.

### 5. Access Your Website
Copy the **Endpoint URL** from Static Website Hosting section.

Example:
```bash
http://my-s3-hands-on-demo.s3-website-us-east-1.amazonaws.com
```

### 📂 Files in this Project

- index.html → The static web page hosted on S3

- README.md → Documentation of the project

### 🎯 Key Learnings

- Creating S3 bucket for website hosting

- Uploading and serving static files

- Configuring bucket policy for public access

- Hosting a simple static site using S3
