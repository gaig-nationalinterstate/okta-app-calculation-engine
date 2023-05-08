resource "okta_app_oauth" "Calculation_Engine_Dashboard" {
  auto_key_rotation          = "true"
  grant_types                = ["authorization_code", "implicit"]
  hide_ios                   = "true"
  hide_web                   = "false"
  implicit_assignment        = "false"
  issuer_mode                = "DYNAMIC"
  label                      = "Calculation Engine Dashboard"
  login_mode                 = "SPEC"
  login_uri                  = "https://${var.url}/calculationenginedashboard/login"
  pkce_required              = "false"
  post_logout_redirect_uris  = ["https://${var.url}/calculationenginedashboard"]
  redirect_uris              = ["https://${var.url}/calculationenginedashboard/callback"]
  response_types             = ["code", "id_token", "token"]
  status                     = "ACTIVE"
  token_endpoint_auth_method = "client_secret_basic"
  type                       = "web"
  wildcard_redirect          = "DISABLED"

  lifecycle {
    ignore_changes = [groups]
  }
}

# Assign groups to Calculation Engine Dashboard
resource "okta_app_group_assignment" "CalculationEngine_Role_UserManager" {
  app_id            = okta_app_oauth.Calculation_Engine_Dashboard.id
  group_id          = okta_group.CalculationEngine_Role_UserManager.id
  retain_assignment = true
}