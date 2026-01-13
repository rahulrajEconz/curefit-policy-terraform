variable "organization_id" {
  description = "The organization ID to apply the policies to"
  type        = string
}

variable "restrict_xpn_project_lien_removal" {
  description = "Restrict shared VPC project lien removal"
  type        = bool
  default     = true
}
