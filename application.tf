resource "azuread_application" "backend_application" {
  for_each          = var.backend_applications

  display_name = each.key
  dynamic "web" {
    for_each  = each.value.web_configs
    content {
      redirect_uris = each.value.redirect_uris
      homepage_url  = each.value.homepage_url
      implicit_grant {
        id_token_issuance_enabled = each.value.issue_id_token
      }
    }
  }

  dynamic "api" {
    for_each  = each.value.api_configs
    content {
      id                         = each.value.id
      value                      = each.value.value
      admin_consent_description  = each.value.admin_consent_description
      admin_consent_display_name = each.value.admin_consent_display_name
      user_consent_description   = each.value.user_consent_description
      user_consent_display_name  = each.value.user_consent_display_name
    }
  }
  /*required_resource_access {
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