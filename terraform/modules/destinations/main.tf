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
    project_id = var.project_id
  }
  name         = "BiqQurey"
  workspace_id = var.workspace_id
}
