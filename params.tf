
variable application_name {
  type        = string
  description = "The name of the application. Should be lowercase with no spaces"
}

variable application_roles {
  type        = list(object({
    description = string,
    display_name = string,
    role_name = string
  }))

  default     = []
  description = "The list of app roles. <role name> = { description, display_name, role_name }"
}