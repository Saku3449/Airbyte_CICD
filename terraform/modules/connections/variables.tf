variable "source_id" {}
variable "destination_id" {}

# https://registry.terraform.io/providers/airbytehq/airbyte/latest/docs/resources/connection
variable "connection_config" {
  type = map(any)
  default = {
    data_residency                       = "auto"
    name                                 = "Poke API → BigQuery"
    namespace_definition                 = "destination"
    non_breaking_schema_updates_behavior = "ignore"
    status                               = "active"
  }
}

variable "cursor_field" {
  type        = list(string)
  description = "Path to the field that will be used to determine if a record is new or modified since the last sync"
  default     = ["date"]
}

variable "streams_config" {
  type = map(any)
  default = {
    name      = "poke_api"
    sync_mode = "incremental_append"
  }
}

variable "schedule" {
  type = map(string)
  default = {
    schedule_type = "manual"
  }
}

