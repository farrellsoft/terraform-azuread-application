
backend_application_name = "test-application"
web_configs = [
  {
    homepage_url = "https://www.google.com"
    issue_id_token = false
    redirect_uris = [
      "https://www.google.com/",
      "https://www.bing.com/"
    ]
  }
]

api_configs = [
  {
    admin_consent_description = "My admin consent description"
    admin_consent_display_name = "My admin consent display name"
    user_consent_description = "User Consent Description"
    user_consent_display_name = "User Consent Display Name"
    value = "some_value"
  }
]

app_roles = [
  {
    allowed_member_types = [ "Application", "User" ]
    description = "My role description"
    display_name = "Role Display name"
    enabled = false
    role_name = "my_role"
  }
]