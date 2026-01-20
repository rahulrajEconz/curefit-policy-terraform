variable "project_id" {
  description = "The project ID to apply the policies to"
  type        = string
}

variable "restrict_xpn_project_lien_removal" {
  description = "Restrict shared VPC project lien removal"
  type        = bool
  default     = true
}
