variable "description" {
  description = "Human-readable purpose of the KMS key."
  type        = string
}

variable "alias_name" {
  description = "Optional KMS alias without the alias/ prefix."
  type        = string
  default     = null
  nullable    = true
}

variable "key_policy" {
  description = "Optional complete KMS key-policy JSON. The default delegates administration to the account root."
  type        = string
  default     = null
  nullable    = true
}

variable "deletion_window_in_days" {
  description = "KMS deletion window in days."
  type        = number
  default     = 30

  validation {
    condition     = var.deletion_window_in_days >= 7 && var.deletion_window_in_days <= 30
    error_message = "deletion_window_in_days must be between 7 and 30."
  }
}

variable "enable_key_rotation" {
  description = "Whether automatic annual KMS key rotation is enabled."
  type        = bool
  default     = true
}

variable "multi_region" {
  description = "Whether the primary KMS key is multi-Region."
  type        = bool
  default     = false
}

variable "key_usage" {
  description = "KMS key usage."
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "customer_master_key_spec" {
  description = "KMS key specification."
  type        = string
  default     = "SYMMETRIC_DEFAULT"
}

variable "tags" {
  description = "Tags applied to the KMS key."
  type        = map(string)
  default     = {}
}
