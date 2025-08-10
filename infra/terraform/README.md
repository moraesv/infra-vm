# Infraestrutura Terraform – Magalu Cloud (Padrão Simples)

## Estrutura
- `versions.tf`: versões do Terraform e provider
- `provider.tf`: configura o provider
- `variables.tf`: variáveis necessárias
- `terraform.tfvars.example`: modelo de variáveis
- `locals.tf`: variáveis internas
- `networking.tf`: vazio (usa rede padrão)
- `main.tf`: VM principal
- `outputs.tf`: informa IP e nome

## Como usar
1. Copie o exemplo:
   ```sh
   cp terraform.tfvars.example terraform.tfvars
   ```
