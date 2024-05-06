resource "aws_eks_access_policy_association" "example" {
  cluster_name  = aws_eks_cluster.burger-box.name
  policy_arn    = var.policyArnEks
  principal_arn = var.principalArn

  access_scope {
    type       = "cluster"
  }
}