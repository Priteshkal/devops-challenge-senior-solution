output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "kubeconfig" {
  description = "Kubernetes Config on Nodes"
  value       = module.eks.kubeconfig
}

output "region" {
  description = "AWS region."
  value       = var.region
}
