
variable "azurevmuser" {}

variable "azurepassword" {
    type = string
    sensitive = true
}


variable "rg_name" { #dummy for local testing 
    type = string
    description = "Resource group name where the blob storage exist"
}


variable "blobstorage" { #dummy for local testing 
    type = string
    description = "Blobstorage for managing the state"
}

variable "blobcontainer" { #dummy for local testing 
    type = string
    description = "container inside the blob storage"
}

variable "azurevnet" {}
variable "azuresubnet" {}

