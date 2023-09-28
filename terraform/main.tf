module "airbyte_workspace" {
  source = "./modules/workspace"
}

module "pokeapi" {
  source       = "./modules/sources"
  workspace_id = module.airbyte_workspace.workspace_id
}

module "bigquery" {
  source       = "./modules/destinations"
  workspace_id = module.airbyte_workspace.workspace_id
  # credentials_json = var.credentials_json
  project_id = var.project_id
}

module "pokeapi_bigquery" {
  source         = "./modules/connections"
  source_id      = module.pokeapi.source_id
  destination_id = module.bigquery.destination_id
}
