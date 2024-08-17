resource "aws_vpc" "vpc_name" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}

# subnet creation 
resource "aws_subnet" "vpc_subnet_name1" {
  vpc_id     = aws_vpc.vpc_name.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "vpc_subnet_name2" {
  vpc_id     = aws_vpc.vpc_name.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "subnet2"
  }
}

#network interface a
resource "aws_network_interface" "network_interface1" {
  subnet_id   = aws_subnet.vpc_subnet_name1.id
  private_ips = ["10.0.1.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

#network interface a
resource "aws_network_interface" "network_interface2" {
  subnet_id   = aws_subnet.vpc_subnet_name2.id
  private_ips = ["10.0.2.100"]

  tags = {
    Name = "primary_network_interface"
  }
}
