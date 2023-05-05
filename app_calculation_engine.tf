resource "okta_app_oauth" "Calculation_Engine" {
  auto_key_rotation          = "true"
  auto_submit_toolbar        = "false"
  grant_types                = ["authorization_code", "implicit"]
  hide_ios                   = "true"
  hide_web                   = "false"
  implicit_assignment        = "false"
  issuer_mode                = "DYNAMIC"
  label                      = "Calculation Engine Test!"
  login_mode                 = "SPEC"
  login_uri                  = "https://${var.url}/calculationengine/login"
  pkce_required              = "false"
  post_logout_redirect_uris  = ["https://${var.url}/calculationengine"]
  redirect_uris              = ["https://${var.url}/calculationengine/callback"]
  response_types             = ["code", "id_token"]
  status                     = "ACTIVE"
  token_endpoint_auth_method = "client_secret_basic"
  type                       = "web"
  wildcard_redirect          = "DISABLED"

  lifecycle {
    ignore_changes = [groups]
  }
}

# Assign groups to Calulation Engine
resource "okta_app_group_assignment" "CalculationEngine_Role_Accounting" {
  app_id            = okta_app_oauth.Calculation_Engine.id
  group_id          = okta_group.CalculationEngine_Role_Accounting.id
  retain_assignment = true
}

resource "okta_app_group_assignment" "CalculationEngine_Role_BillingRep" {
  app_id            = okta_app_oauth.Calculation_Engine.id
  group_id          = okta_group.CalculationEngine_Role_BillingRep.id
  retain_assignment = true
}

resource "okta_app_group_assignment" "CalculationEngine_Role_Manager" {
  app_id            = okta_app_oauth.Calculation_Engine.id
  group_id          = okta_group.CalculationEngine_Role_Manager.id
  retain_assignment = true
}