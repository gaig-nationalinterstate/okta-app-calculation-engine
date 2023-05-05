resource "okta_auth_server_scope" "calcengine" {
  auth_server_id   = data.okta_auth_server.default.id
  consent          = "IMPLICIT"
  default          = "false"
  description      = "Return Calculation Engine Roles"
  display_name     = "calcengine"
  metadata_publish = "NO_CLIENTS"
  name             = "calcengine"
}