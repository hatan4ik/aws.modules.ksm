# aws.modules.ksm

Versioned Terraform module for a customer-managed AWS KMS key. The repository
name is kept as `ksm` to match the existing GitHub repository; the module
manages KMS resources. A caller may supply a complete least-privilege key
policy; the safe default delegates administration only to the account root.
