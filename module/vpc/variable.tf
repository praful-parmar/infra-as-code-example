variable "name" {
}
variable "cidr" {
}
variable "enable_nat_gateway" {
      type        = bool
}
variable "enable_vpn_gateway" {
      type        = bool
}
variable "azs" {
      type        = list(string)
}
variable "public_subnets" {
  type        = list(string)
}
variable "private_subnets" {
      type        = list(string)
}
variable "database_subnets" {
      type        = list(string)
}
variable "single_nat_gateway" {
  
    type        = bool
}