
variable "azurevmuser" {}

variable "azurepassword" {
    type = string
    sensitive = true
    description = "name of the resource which is to be create"
    # validation {
    #     condition = substr(var.rg_name,0,4) == "mani"
    #     error_message = "resource groupname should start with mani"

    # }
}


variable "rg_name" {
    default = "maninder"
    type = string
    description = "name of the resource which is to be create"
    # validation {
    #     condition = substr(var.rg_name,0,4) == "mani"
    #     error_message = "resource groupname should start with mani"

    # }
}
