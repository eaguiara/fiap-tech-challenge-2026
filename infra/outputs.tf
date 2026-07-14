output "cluster_name" {
  value = var.cluster_name
}
output "kubernetes_manifest_path" {
  value = var.k8s_manifest_path
}
output "sql_arn_id" {
  value = aws_db_instance.sql_server.arn
}

output "eks_cluster_name"{
  value = module.eks.cluster_name
}

output "eks_cluster_endpoint"{
  value = module.eks.cluster_endpoint
}

output "eks_cluster_arn" {
  value = module.eks.cluster_arn
}