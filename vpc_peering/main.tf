provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "vpc1" {
  cidr_block = <give cidr block>
}

resource "aws_vpc" "vpc2" {
  cidr_block = <give cidr block>
}

resource "aws_vpc_peering_connection" "vpc_peer" {
  vpc_id      = aws_vpc.vpc1.id
  peer_vpc_id = aws_vpc.vpc2.id
  auto_accept = true
}

resource "aws_route" "vpc1_to_vpc2" {
  route_table_id            = aws_vpc.vpc1.main_route_table_id
  destination_cidr_block    = aws_vpc.vpc2.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer.id
}

resource "aws_route" "vpc2_to_vpc1" {
  route_table_id            = aws_vpc.vpc2.main_route_table_id
  destination_cidr_block    = aws_vpc.vpc1.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peer.id
}
