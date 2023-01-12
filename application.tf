
resource random_uuid roleids {
  count = length(var.application_roles)
}

resource azuread_application this {
  display_name        = var.application_name
  identifier_uris     = [
    "api://${var.application_name}",
  ]

  dynamic "app_role" {
    for_each = var.application_roles
    content {
      allowed_member_types = [
        "Application"
      ]

      description   = app_role.value.description
      display_name  = app_role.value.display_name
      enabled       = true
      id            = index(var.application_roles, app_role.value)
      value         = app_role.value.role_name
    }
  }
}