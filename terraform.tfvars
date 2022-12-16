
backend_application_name = "backend-application2"
web_configs = [
  {
    issue_id_token = true
    redirect_uris = [
      "https://func-auth-header-printer.azurewebsites.net/.auth/login/aad/callback"
    ]
  }
]

api_configs = [
  {
    admin_consent_description = "My admin consent description"
    admin_consent_display_name = "My admin consent display name"
    user_consent_description = "User Consent Description"
    user_consent_display_name = "User Consent Display Name"
    value = "user_impersonation"
  }
]

app_roles = [
  {
    allowed_member_types = [ "Application", "User" ]
    description = "Write Content"
    display_name = "Write Content"
    enabled = true
    role_name = "Content.Write"
  }
]