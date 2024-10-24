variable "compartment_ocid" {
  description = "The OCID of the compartment where the resources will be created"
  default = "" 
}

variable "tenancy_ocid" {
  description = "The OCID of your tenancy"
  default = "" 
}

variable "user_ocid" {
  description = "The OCID of your user"
  default = "" 
}

variable "fingerprint" {
  description = "Your API key fingerprint"
  default = ""
}

variable "private_key_path" {
  description = "The path to your private API key"
  default = "" 
}