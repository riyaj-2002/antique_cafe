
# CREATE VPC
resource "aws_vpc" "vpc" {
    cidr_block           = var.vpc_cidr
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags = {
        Name = "${var.project_name}-vpc"
    }
}

# CREATE INTERNET GATEWAY
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "${var.project_name}-igw"
    }
}

# AVAILABILITY ZONES
data "aws_availability_zones" "available" {
    state = "available"
}

# CREATE PUBLIC SUBNET 1
resource "aws_subnet" "public_subnet_1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.cidr_block_public_subnet_1
    availability_zone       = data.aws_availability_zones.available.names[0]
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.project_name}-public-subnet-1"
    }
}

# CREATE PUBLIC SUBNET 2
resource "aws_subnet" "public_subnet_2" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.cidr_block_public_subnet_2
    availability_zone       = data.aws_availability_zones.available.names[1]
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.project_name}-public-subnet-2"
    }
}

# CREATE ROUTE TABLE
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
        tags = {
           Name = "${var.project_name}-public-rt"
        }
    
}

# ASSOCIATE ROUTE TABLE WITH PUBLIC SUBNET 1
resource "aws_route_table_association" "public_rt_assoc_1" {
    subnet_id      = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.public_rt.id
}

# ASSOCIATE ROUTE TABLE WITH PUBLIC SUBNET 2
resource "aws_route_table_association" "public_rt_assoc_2" {
    subnet_id      = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.public_rt.id
}


# CREATE PRIVATE SUBNET 1
resource "aws_subnet" "private_subnet_1" {
    vpc_id            = aws_vpc.vpc.id
    cidr_block        = var.cidr_block_private_subnet_1
    availability_zone = data.aws_availability_zones.available.names[0]
    tags = {
        Name = "${var.project_name}-private-subnet-1"
    }
}

# CREATE PRIVATE SUBNET 2
resource "aws_subnet" "private_subnet_2" {
    vpc_id            = aws_vpc.vpc.id
    cidr_block        = var.cidr_block_private_subnet_2
    availability_zone = data.aws_availability_zones.available.names[0]
    tags = {
        Name = "${var.project_name}-private-subnet-2"
    }
}

# CREATE PRIVATE SUBNET 3
resource "aws_subnet" "private_subnet_3" {
    vpc_id            = aws_vpc.vpc.id
    cidr_block        = var.cidr_block_private_subnet_3
    availability_zone = data.aws_availability_zones.available.names[1]
    tags = {
        Name = "${var.project_name}-private-subnet-3"
    }
}

# CREATE PRIVATE SUBNET 4
resource "aws_subnet" "private_subnet_4" {
    vpc_id            = aws_vpc.vpc.id
    cidr_block        = var.cidr_block_private_subnet_4
    availability_zone = data.aws_availability_zones.available.names[1]
    tags = {
        Name = "${var.project_name}-private-subnet-4"
    }
}