# Infraestrutura

Este diretório contém o bootstrap local da fase 2.

## O que é provisionado

1. Um cluster Kubernetes local com `kind`.
2. Os manifests da pasta `../k8s` aplicados via `kubectl apply -k`.
3. A aplicação e o banco de dados publicados no cluster por meio dos manifests.

## Pré-requisitos

- Terraform 1.5+
- `kind`
- `kubectl`
- Docker Desktop ou Docker Engine em execução

## Como aplicar

```powershell
terraform init
terraform apply
```

## Observação

O bootstrap local usa `kind` e pressupõe que os comandos estejam no `PATH`.