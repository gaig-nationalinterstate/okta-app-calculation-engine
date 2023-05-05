resource "okta_auth_server_claim" "calcengine" {
  always_include_in_token = "true"
  auth_server_id          = data.okta_auth_server.default.id
  claim_type              = "IDENTITY"
  group_filter_type       = "STARTS_WITH"
  name                    = "calcengine"
  scopes                  = [okta_auth_server_scope.calcengine.name]
  status                  = "ACTIVE"
  value                   = "CalculationEngine_Role"
  value_type              = "GROUPS"
}