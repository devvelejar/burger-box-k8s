variable "labRole" {
  default = "arn:aws:iam::467827799632:role/LabRole"
}

variable "principalArn" {
  default = "arn:aws:iam::467827799632:role/voclabs"
}

variable "subnetA" {
  default = "subnet-0b2507e8acdbc95f0"
}

variable "subnetB" {
  default = "subnet-05422e17fe674db83"
}

variable "subnetC" {
  default = "subnet-01d4db74f33782b1b"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "sgId" {
  default = "sg-08ab9e9e9e92d8327"
}

variable "policyArnEks" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "nodeName" {
  default = "nodeFase3"
}
