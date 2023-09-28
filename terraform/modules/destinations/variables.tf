variable "workspace_id" {}
variable "credentials_json" {}
variable "project_id" {}

variable "bigquery_config" {
  type = map(any)
  default = {
    big_query_client_buffer_size_mb = 15
    dataset_location                = "asia-northeast1"
    destination_type                = "bigquery"
    transformation_priority         = "batch"
    name                            = "BigQuery"
  }
}

variable "dataset_id" {
  type        = string
  description = "The default BigQuery Dataset ID"
  default     = "airbyte_test"
}

