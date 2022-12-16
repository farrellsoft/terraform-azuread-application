
resource "random_uuid" "api_ids" {
  count = length(var.app_roles)
}

resource "random_uuid" "role_ids" {
  count = length(var.app_roles)
}

resource "azuread_application" "backend_application" {
  display_name      = var.backend_application_name
  owners            = [data.azurerm_client_config.current.object_id]
  identifier_uris   = [ "api://backend-application2" ]

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
        id                         = random_uuid.api_ids[api.key].result
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
      id                   = random_uuid.role_ids[app_role.key].result
      enabled              = app_role.value.enabled
      value                = app_role.value.role_name
    }
  }
}

resource azuread_service_principal backend_application_sp {
  application_id               = azuread_application.backend_application.application_id
  app_role_assignment_required = false
  feature_tags {
    enterprise = true
    gallery    = false
  }
}