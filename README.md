# Infra VM

Este projeto utiliza **infraestrutura como código** para gerenciar e automatizar a configuração de serviços como **Homer**, **Portainer** e **Traefik**. As ferramentas principais utilizadas são **Ansible**, **Terraform** e **Docker Compose**.

## Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas no seu ambiente:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Ansible](https://www.ansible.com/)
- [Terraform](https://www.terraform.io/)

## Estrutura do Projeto

- **apps/**: Contém os serviços configurados com Docker Compose.
  - **homer/**: Configuração do Homer.
  - **portainer/**: Configuração do Portainer.
  - **traefik/**: Configuração do Traefik.
- **infra/**: Contém os arquivos de configuração do Ansible e Terraform.
  - **ansible/**: Playbooks e roles para automação.
  - **terraform/**: Configuração de infraestrutura com Terraform.

## Configuração

### 1. Configuração do Docker Compose

Cada serviço possui seu próprio arquivo `docker-compose.yml`. Para iniciar os serviços, navegue até o diretório do serviço e execute:

```bash
docker-compose up -d
```

### 2. Configuração do Ansible

Edite o arquivo `inventory.ini` para incluir os hosts que deseja gerenciar. Em seguida, execute o playbook principal:

```bash
ansible-playbook -i inventory.ini playbook.yml
```

### 3. Configuração do Terraform

Edite o arquivo `terraform.tfvars` com as variáveis necessárias. Para aplicar as configurações, execute:

```bash
terraform init
terraform plan
terraform apply
```

## Acesso aos Serviços

- **Homer**: [http://127.0.0.1:81](http://127.0.0.1:81)
- **Portainer**: [http://127.0.0.1:9000](http://127.0.0.1:9000)
- **Traefik**: [http://127.0.0.1:8080](http://127.0.0.1:8080)

### Credenciais Padrão

- **Email**: `admin@example.com`
- **Senha**: `changeme`

## Segurança

- Certifique-se de alterar as credenciais padrão antes de expor os serviços publicamente.
- Utilize ferramentas como o `Vault` do Ansible para gerenciar segredos.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.