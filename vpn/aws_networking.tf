/*
 * Terraform networking resources for AWS.
 */

data "aws_vpc" "aws-vpc" {
  id = var.aws_vpc_id
}

/*
 * ----------VPN Connection----------
 */

resource "aws_vpn_gateway" "aws-vpn-gw" {
  vpc_id = data.aws_vpc.aws-vpc.id
}

resource "aws_customer_gateway" "aws-cgw" {
  bgp_asn    = 65000
  ip_address = google_compute_address.gcp-vpn-ip.address
  type       = "ipsec.1"
  tags = {
    "Name" = "aws-customer-gw"
  }
}

resource "aws_vpn_connection" "aws-vpn-connection1" {
  vpn_gateway_id      = aws_vpn_gateway.aws-vpn-gw.id
  customer_gateway_id = aws_customer_gateway.aws-cgw.id
  type                = "ipsec.1"
  static_routes_only  = false
  tags = {
    "Name" = "aws-vpn-connection1"
  }
}
