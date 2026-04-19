# AWS DevOps Deployment

This portfolio is prepared for an AWS static-site deployment using:

- `Amazon S3` for hosting files
- `Amazon CloudFront` for HTTPS and CDN delivery
- `Amazon Route 53` for optional custom DNS
- `GitHub Actions` for CI/CD deployment
- `Terraform` for infrastructure provisioning

## 1. Provision AWS infrastructure

From `infra/terraform`:

```bash
terraform init
terraform plan -out tfplan
terraform apply tfplan
```

If you want a custom domain:

1. Copy `terraform.tfvars.example` to `terraform.tfvars`
2. Set `enable_custom_domain = true`
3. Fill `domain_name` and `hosted_zone_name`
4. Re-run `terraform apply`

## 2. Create a GitHub Actions deploy role

Create an IAM role that GitHub Actions can assume with OIDC and give it permissions for:

- `s3:ListBucket`
- `s3:GetObject`
- `s3:PutObject`
- `s3:DeleteObject`
- `cloudfront:CreateInvalidation`

The role should trust GitHub's OIDC provider and your repository.

## 3. Add GitHub repository secrets

Set these secrets in GitHub:

- `AWS_GITHUB_ACTIONS_ROLE_ARN`
- `AWS_REGION`
- `AWS_S3_BUCKET`
- `AWS_CLOUDFRONT_DISTRIBUTION_ID`

## 4. Deploy

Push to the `main` branch. The workflow in `.github/workflows/deploy.yml` will:

1. authenticate to AWS
2. sync the site files to S3
3. invalidate CloudFront cache

## 5. What gets deployed

The pipeline uploads the static site files only:

- `index.html`
- `styles.css`
- `script.js`
- `profile-photo.png`
- `Pavan-S-Resume.pdf`

It excludes:

- `.git`
- `.github`
- `infra`
- markdown docs

## 6. Recommended next step

After first deployment, add the final site URL to your portfolio contact section and resume so recruiters can open it directly.
