resource "aws_eks_access_entry" "access" {
  cluster_name = aws_eks_cluster.burger-box.name
  principal_arn = var.principalArn
  kubernetes_groups = ["fiap", "fase3"]
  type = "STANDARD"
}