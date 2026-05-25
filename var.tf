variable "resource-group" {
    default = "TerraformRG"
}

variable "region" {
    default = "Central India"
}

variable "vnet" {
    default = "myVnet"
}

variable "network-prefix" {
    default = ["10.0.0.0/16"]
}

variable "subnet" {
    default = "mySubnet"
}

variable "subnet-prefix" {
    default = "10.0.1.0/24"
}

variable "Netinterface" {
    default = "myNIC"
}

variable "ipallocation" {
    default = "Dynamic"
}

variable "vmname" {
    default = "myVM"
}

variable "vmsize" {
    default = "Standard_D2s_v3"
}