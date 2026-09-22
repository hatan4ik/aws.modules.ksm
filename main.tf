data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

locals {
  default_key_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "EnableRootUserPermissions"
      Effect    = "Allow"
      Principal = { AWS = "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:root" }
      Action    = "kms:*"
      Resource  = "*"
    }]
  })
}

resource "aws_kms_key" "this" {
  description              = var.description
  deletion_window_in_days  = var.deletion_window_in_days
  enable_key_rotation      = var.enable_key_rotation
  multi_region             = var.multi_region
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  policy                   = coalesce(var.key_policy, local.default_key_policy)
  tags                     = var.tags
}

resource "aws_kms_alias" "this" {
  count = var.alias_name == null ? 0 : 1

  name          = "alias/${var.alias_name}"
  target_key_id = aws_kms_key.this.key_id
}
