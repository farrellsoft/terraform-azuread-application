resource "azuread_application" "backend_application" {
  display_name = var.backend_application_name

  dynamic "web" {
    for_each  = var.web_configs
    content {
      redirect_uris = web.value.redirect_uris
      homepage_url  = web.value.homepage_url
      implicit_grant {
        id_token_issuance_enabled = web.value.issue_id_token
      }
    }
  }

  dynamic "api" {
    for_each  = var.api_configs
    content {
      oauth2_permission_scope {
        id                         = uuid()
        value                      = api.value.value
        admin_consent_description  = api.value.admin_consent_description
        admin_consent_display_name = api.value.admin_consent_display_name
        user_consent_description   = api.value.user_consent_description
        user_consent_display_name  = api.value.user_consent_display_name
      }
    }
  }

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000" # Microsoft Graph

    resource_access {
      id   = "df021288-bdef-4463-88db-98f22de89214" # User.Read.All
      type = "Role"
    }
  }

  dynamic "app_role" {
    for_each  = var.app_roles
    content {
      allowed_member_types = app_role.value.allowed_member_types
      description          = app_role.value.description
      display_name         = app_role.value.display_name
      id                   = uuid()
      enabled              = app_role.value.enabled
      value                = app_role.value.role_name
    }
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
  }
}