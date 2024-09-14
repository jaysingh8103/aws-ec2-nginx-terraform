resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags ={
        name = "my_vpc"
    }
}
#public subnet
resource "aws_subnet" "public-subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.my-vpc.id
    tags ={
        name = "public-subnet"
    } 
}
#private subnet
resource "aws_subnet" "private-subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        name = "private-subnet"
    } 
}

#internet getway
resource "aws_internet_gateway" "my-int-get-way" {
    vpc_id = aws_vpc.my-vpc.id
    tags= {
        name ="my-int-get-way"
    }  
}

#route table 

resource "aws_route_table" "my-rt" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-int-get-way.id
  }

  tags = {
    Name = "my-route-table"
  }
}


resource "aws_route_table_association" "public-sub" {
    route_table_id = aws_route_table.my-rt.id
    subnet_id = aws_subnet.public-subnet.id  
}