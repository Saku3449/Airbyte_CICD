resource "airbyte_connection" "my_connection" {
  destination_id = var.destination_id
  name           = "PokeAPI → BigQuery"
  schedule = {
    schedule_type = "manual"
  }
  source_id = var.source_id
}
