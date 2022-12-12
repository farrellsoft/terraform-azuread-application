
output backend_application_principal_id {
  value       = azuread_application.backend_application.object_id
  description = "The application ID of the backend application."
}

output app_role_ids {
  value = {
    for item in azuread_application.backend_application.app_role[*] : item.value => item.id
  }

  description = "The IDs of the app roles for the backend application."
}