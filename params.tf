
variable backend_applications {
  type        = map(object({
    web_configs = optional(list(object({
      redirect_uris   = optional(list(string), [])
      homepage_url    = optional(string)
      issue_id_token  = optional(bool, false)
    })), [])

    api_configs = optional(list(object({
      oauth2_permission_scopes = list(object({
        id                          = string
        value                       = string
        admin_consent_description   = string
        admin_consent_display_name  = string
        user_consent_description    = string
        user_consent_display_name   = string
      }))
    })), [])
  }))

  default = {}
  description = "The application registrations you wish to create. Key with application name"
}