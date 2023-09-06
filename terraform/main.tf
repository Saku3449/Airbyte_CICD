terraform {
  required_version = "1.4.6"

  required_providers {
    airbyte = {
      source  = "airbytehq/airbyte"
      version = "0.3.3"
    }
  }
}

provider "airbyte" {
  bearer_auth = var.airbyte_cloud_api_key
}

resource "airbyte_workspace" "workspace" {
  name = "airbyte_workspace"
}

resource "airbyte_source_pokeapi" "my_source_pokeapi" {
  configuration = {
    pokemon_name = "snorlax"
    source_type  = "pokeapi"
  }
  name         = "PokeAPI"
  workspace_id = airbyte_workspace.workspace.workspace_id
}

resource "airbyte_destination_bigquery" "my_destination_bigquery" {
  configuration = {
    credentials_json = var.credentials_json
    dataset_id       = "airbyte_test"
    dataset_location = "asia-northeast1"
    destination_type = "bigquery"
    loading_method = {
      destination_bigquery_loading_method_standard_inserts = {
        method = "Standard"
      }
    }
    project_id = "compact-system-398013"
  }
  name         = "BiqQurey"
  workspace_id = airbyte_workspace.workspace.workspace_id
}

resource "airbyte_connection" "my_connection" {
  destination_id = airbyte_destination_bigquery.my_destination_bigquery.destination_id
  name           = "PokeAPI → BigQuery"
  schedule = {
    schedule_type = "manual"
  }
  source_id = airbyte_source_pokeapi.my_source_pokeapi.source_id
}
