
output application_id {
  value       = azuread_application.this.application_id
  description = "The application ID of the backend application."
}

output application_id_uri {
  value       = "api://${var.application_name}"
  description = "The application ID URI of the backend application."
}