# Create Calculation Engine Groups
resource "okta_group" "CalculationEngine_Role_Accounting" {
  name = "CalculationEngine_Role_Accounting"
}

resource "okta_group" "CalculationEngine_Role_BillingRep" {
  name = "CalculationEngine_Role_BillingRep"
}

resource "okta_group" "CalculationEngine_Role_Manager" {
  name = "CalculationEngine_Role_Manager"
}

resource "okta_group" "CalculationEngine_Role_UserManager" {
  name = "CalculationEngine_Role_UserManager"
}

