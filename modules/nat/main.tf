
# create elastic IP 1 for NAT gateways
resource "aws_eip" "nat_eip_1" {

    tags = {
        Name = "${var.project_name}-nat-eip-1"
    }
}

# create elastic IP 2 for NAT gateways
resource "aws_eip" "nat_eip_2" {

    tags = {
        Name = "${var.project_name}-nat-eip-2"
    }
}

# create NAT gateway 1 in public subnet 1
resource "aws_nat_gateway" "nat_gw_1" {
    allocation_id = aws_eip.nat_eip_1.id
    subnet_id = var.public_subnet_1_id

    tags = {
        Name = "${var.project_name}-nat-gw-1"
    }
}

# create NAT gateway 2 in public subnet 2
resource "aws_nat_gateway" "nat_gw_2" {
    allocation_id = aws_eip.nat_eip_2.id
    subnet_id = var.public_subnet_2_id

    tags = {
        Name = "${var.project_name}-nat-gw-2"
    }
}

# create route tables for private subnet 1 & 2 and associate them with NAT gateway 1
resource "aws_route_table" "private_rt_1" {
    vpc_id = var.vpc_id
    route  {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gw_1.id
    }
    tags = {
        Name = "${var.project_name}-private-rt-1"
    }
}


# create route table associations for private subnet 1 with private_rt_1
resource "aws_route_table_association" "private_rt_1_assoc_1" {
    subnet_id = var.private_subnet_1_id
    route_table_id = aws_route_table.private_rt_1.id
  
}

# create route table associations for private subnet 2 with private_rt_1
resource "aws_route_table_association" "private_rt_1_assoc_2" {
    subnet_id = var.private_subnet_2_id
    route_table_id = aws_route_table.private_rt_1.id
  
}

# create route tables for private subnet 3 & 4 and associate them with NAT gateway 2 
resource "aws_route_table" "private_rt_2" {
    vpc_id = var.vpc_id
    route  {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gw_2.id
    }
    tags = {
        Name = "${var.project_name}-private-rt-2"
}   
}


# create route table associations for private subnet 3 with private_rt_2
resource "aws_route_table_association" "private_rt_2_assoc_3" {
    subnet_id = var.private_subnet_3_id
    route_table_id = aws_route_table.private_rt_2.id
  
}


# create route table associations for private subnet 4 with private_rt_2
resource "aws_route_table_association" "private_rt_2_assoc_4" {
    subnet_id = var.private_subnet_4_id
    route_table_id = aws_route_table.private_rt_2.id
  
}



