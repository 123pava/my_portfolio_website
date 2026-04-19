variable "project_name" {
  description = "Short name used for resource naming."
  type        = string
  default     = "pavan-portfolio"
}

variable "aws_region" {
  description = "Primary AWS region for S3 and Route 53 data."
  type        = string
  default     = "ap-south-1"
}

variable "tags" {
  description = "Common AWS tags."
  type        = map(string)
  default = {
    Project = "portfolio"
    Owner   = "pavan"
  }
}

variable "enable_custom_domain" {
  description = "Enable Route 53 and ACM resources for a custom domain."
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "Root domain for the site, for example pavans.dev."
  type        = string
  default     = ""
}

variable "hosted_zone_name" {
  description = "Existing Route 53 hosted zone name, for example pavans.dev."
  type        = string
  default     = ""
}
