terraform {
	required_version = ">= 1.3.0"

	required_providers {
		null = {
			source  = "hashicorp/null"
			version = "~> 3.2"
		}
	}
}

provider "null" {}

provider "null" {
	alias = "secondary"
}

module "provider_test" {
	source = "../module"

	providers = {
		null.secondary = null.secondary
	}
}
