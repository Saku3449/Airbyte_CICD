variable "project_id" {
  type        = string
  description = "GCPプロジェクトID"
  default     = "compact-system-398013"
}

variable "airbyte_cloud_api_key" {
  type        = string
  description = "Airbyte CloudのAPIキー"
}

variable "credentials_json" {
  type        = string
  description = "Google Cloudのアクセスキー(json形式)"
}
