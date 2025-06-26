#
# Variables Configuration
#

variable "cluster-name" {
  default = "eks-nfesta"
  type    = string
}
variable "key_pair_name" {
  default = "mytest1"
}
variable "eks_node_instance_type" {
  default = "t2.medium"
}

variable "availability_zone"{
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "subnet_cdir_block" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_cdir_block" {
  type = string
  default = "10.0.0.0/16"
}
