variable "key_name" {
    description = "key pair name for ec3 instanace"
    type = string
}

variable "cidr_block" {
    description = "cidr block for my vpc"
    type = string
}

variable "public_cidr_block" {
    description = "cidr block for my subnets"
    type = string
}
variable "private_cidr_block" {
    description = "cidr block for my subntes"
    type = string
}