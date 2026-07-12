resource "null_resource" "kind_cluster" {
  triggers = {
    cluster_name = var.cluster_name
  }

  provisioner "local-exec" {
    interpreter = ["PowerShell", "-NoProfile", "-Command"]
    command = <<-EOT
      $clusters = kind get clusters
      if ($clusters -notcontains "${var.cluster_name}") {
        kind create cluster --name "${var.cluster_name}"
      }
    EOT
  }
}

resource "null_resource" "apply_manifests" {
  triggers = {
    manifest_hash = sha1(join("", [for file in fileset("${path.module}/${var.k8s_manifest_path}", "**") : filesha1("${path.module}/${var.k8s_manifest_path}/${file}")]))
  }

  depends_on = [null_resource.kind_cluster]

  provisioner "local-exec" {
    interpreter = ["PowerShell", "-NoProfile", "-Command"]
    command = "kubectl apply -k \"${path.module}/${var.k8s_manifest_path}\""
  }
}