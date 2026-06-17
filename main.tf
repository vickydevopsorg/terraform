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
	source = "./module"

	# commenting out the provider mapping to null.primary to test behavior when one required provider mapping is missing.
	providers = {
		null.secondary = null.secondary
	}
}
