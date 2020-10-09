#
# GCP Input Variables
#

variable "gcp_credentials_file_path" {
  type = string
  description = "The location of the GCP credentials file."
}

variable "gcp_project_id" {
  type = string
  description = "The project containing the network to connect from GCP"
}

variable "gcp_region" {
  type = string
  description = "The GCP region where the network is located"
}

variable "gcp_network_name" {
  type = string
  description = "The name of the network to connect the VPN to in GCP eg: default"
}

variable "GCP_TUN1_VPN_GW_ASN" {
  description = "Tunnel 1 - Virtual Private Gateway ASN, from the AWS VPN Customer Gateway Configuration"
  default     = "64512"
}

variable "GCP_TUN1_CUSTOMER_GW_INSIDE_NETWORK_CIDR" {
  description = "Tunnel 1 - Customer Gateway from Inside IP Address CIDR block, from AWS VPN Customer Gateway Configuration"
  default     = "30"
}

variable "GCP_TUN2_VPN_GW_ASN" {
  description = "Tunnel 2 - Virtual Private Gateway ASN, from the AWS VPN Customer Gateway Configuration"
  default     = "64512"
}

variable "GCP_TUN2_CUSTOMER_GW_INSIDE_NETWORK_CIDR" {
  description = "Tunnel 2 - Customer Gateway from Inside IP Address CIDR block, from AWS VPN Customer Gateway Configuration"
  default     = "30"
}
