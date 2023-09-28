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
