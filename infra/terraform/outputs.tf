output "s3_bucket_name" {
  description = "Name of the portfolio S3 bucket."
  value       = aws_s3_bucket.site.bucket
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID for cache invalidations."
  value       = aws_cloudfront_distribution.site.id
}

output "cloudfront_domain_name" {
  description = "CloudFront domain name for the deployed site."
  value       = aws_cloudfront_distribution.site.domain_name
}

output "site_url" {
  description = "Primary URL to access the site."
  value       = var.enable_custom_domain ? "https://${var.domain_name}" : "https://${aws_cloudfront_distribution.site.domain_name}"
}
