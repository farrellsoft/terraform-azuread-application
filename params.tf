

variable backend_application_name {
  type        = string
  description = "The name of the application registration"
}

variable web_configs {
  type        = list(object({
    redirect_uris       = list(string)
    homepage_url        = optional(string, null)
    issue_id_token      = optional(bool, false)
    issue_access_token  = optional(bool, true)
  }))

  default = []
  description = "The web configurations for the application registration"
}

variable api_configs {
  type = list(object({
    value                       = string
    admin_consent_description   = string
    admin_consent_display_name  = string
    user_consent_description    = string
    user_consent_display_name   = string
  }))

  default = []
  description = "The API configurations for the application registration"
}

variable app_roles {
  type = list(object({
    allowed_member_types = list(string)
    description          = string
    display_name         = string
    enabled              = optional(bool, true)
    role_name            = string
  }))

  default = []
  description = "The application roles for the application registration"
}