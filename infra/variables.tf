variable "cluster_name" {
  description = "Name of the local Kubernetes cluster created with kind."
  type        = string
  default     = "garageflow"
}

variable "k8s_manifest_path" {
  description = "Relative path to the Kubernetes manifests directory."
  type        = string
  default     = "../k8s"
}