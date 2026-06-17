terraform {
  required_providers {
    null = {
      source                = "hashicorp/null"
      version               = "~> 3.2"
      configuration_aliases = [null.secondary]
    }
  }
}

resource "null_resource" "primary" {
  provisioner "local-exec" {
    command = "echo module primary provider"
  }
}

resource "null_resource" "secondary" {
  provider = null.secondary

  provisioner "local-exec" {
    command = "echo module secondary provider"
  }
}