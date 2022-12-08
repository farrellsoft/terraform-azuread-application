
variable backend_application_name {
  type        = string
  description = "The name of the application registration you wish to create."
}

variable web_config {
  type        = list(object({
    redirect_uris   = optional(list(string), [])
    homepage_url    = optional(string)
    issue_id_token  = optional(bool, false)
  }))

  default = []
}