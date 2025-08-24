# Infra VM

Este projeto utiliza **infraestrutura como código** para gerenciar e automatizar a configuração de serviços como **Homer**, **Portainer** e **Traefik**. As ferramentas principais utilizadas são **Ansible**, **Terraform** e **Docker Compose**.

## Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas no seu ambiente:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Ansible](https://www.ansible.com/)
- [Terraform](https://www.terraform.io/)


## Geração automática do arquivo inventory.ini

Para facilitar a configuração do Ansible, utilize o script de geração automática do arquivo `inventory.ini`:

1. Edite o arquivo `.env` em `infra/ansible/.env` com os dados do seu ambiente:
  ```env
  ANSIBLE_HOST=viniciusmoraes.duckdns.org
  ANSIBLE_USER=ubuntu
  ANSIBLE_KEY=../../infra-vm-key
  ```

2. Execute o script para gerar o arquivo:
  ```bash
  infra/ansible/gen_inventory.sh
  ```

O arquivo `inventory.ini` será criado automaticamente com base nas variáveis do `.env`.

**Recomendação:** Não versionar o arquivo `inventory.ini` com dados reais. Mantenha apenas um exemplo (`inventory.ini.example`) no repositório.


## Deploy Centralizado de Apps via Docker Compose

### Estrutura

Todos os aplicativos devem estar organizados em subpastas dentro de `apps/` (ex: `apps/traefik`, `apps/homer`, `apps/portainer`).

### Configuração dos Apps e Exclusões

Edite o arquivo `infra/ansible/vars/docker_apps.yml` para adicionar novos apps ou definir arquivos/pastas a serem excluídos durante o deploy:

```yaml
docker_apps:
  - name: traefik
    src: "../../apps/traefik/"
    dest: "/opt/traefik/"
    excludes:
      - letsencrypt
      - acme.json
  - name: homer
    src: "../../apps/homer/"
    dest: "/opt/homer/"
    excludes: []
  - name: portainer
    src: "../../apps/portainer/"
    dest: "/opt/portainer/"
    excludes: []
```

### Executando o Deploy Centralizado

Para realizar o deploy de todos os apps definidos:

```bash
ansible-playbook infra/ansible/playbook_deploy_apps.yml -i infra/ansible/inventory.ini
```

### Checklist de Segurança

- [ ] Todos os arquivos sensíveis estão excluídos do processo de cópia?
- [ ] As variáveis sensíveis estão protegidas com Ansible Vault ou equivalente?
- [ ] Os volumes persistentes não são sobrescritos pelo Ansible?
- [ ] O acesso aos diretórios dos apps está restrito?
- [ ] A documentação orienta sobre práticas seguras de deploy?

### Exemplos de Adição de Novo App

1. Crie a pasta do app em `apps/` e adicione o `docker-compose.yml`.
2. Adicione o app e possíveis exclusões em `infra/ansible/vars/docker_apps.yml`.
3. Execute o playbook para realizar o deploy.

### Observações

- Sempre revise as recomendações de segurança antes de cada deploy.
- Atualize este guia conforme novos apps ou práticas forem adotados.

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