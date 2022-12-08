resource "azuread_application" "backend_application" {
  display_name = var.backend_application_name

  dynamic "web" {
    for_each  = var.web_config
    content {
      redirect_uris = each.value.redirect_uris
      homepage_url  = each.value.homepage_url
      implicit_grant {
        id_token_issuance_enabled = each.value.issue_id_token
      }
    }
  }
  /*api {
    oauth2_permission_scope {
      id                         = random_uuid.function_private_scope.result
      value                      = "user_impersonation"
      admin_consent_description  = "Allow the application to access ${var.prefix}-private on behalf of the signed-in user."
      admin_consent_display_name = "Access ${var.prefix}-private"
      user_consent_description   = "Allow the application to access ${var.prefix}-private on your behalf."
      user_consent_display_name  = "Access ${var.prefix}-private"
    }
  }
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "df021288-bdef-4463-88db-98f22de89214" # User.Read.All
      type = "Role"
    }
  }

  app_role {
    allowed_member_types = ["Application","User"]
    description          = "Example role."
    display_name         = "Example role"
    id                   = random_uuid.function_private_role.result
    enabled              = true
    value                = local.private_app_role_name
  }

  optional_claims {
    access_token {
      name = "groups"
    }
    id_token {
      name = "groups"
    }
    saml2_token {
      name = "groups"
    }
  }*/
}