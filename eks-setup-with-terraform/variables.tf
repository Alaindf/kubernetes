#
# Variables Configuration
#

variable "cluster-name" {
  default = "eks-nfesta"
  type    = string
}
variable "key_pair_name" {
  default = "keyeks"
}
variable "eks_node_instance_type" {
  default = "t2.medium"
}
