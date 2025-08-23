# Objetivos do Projeto infra-vm

Este documento tem como objetivo listar e detalhar as metas do projeto **infra-vm**, focado em infraestrutura como código e automação de ambientes para o desenvolvimento full stack.

---

## Objetivos Gerais

1. **Automatizar a Infraestrutura**
   - Provisionar máquinas virtuais e recursos utilizando **Terraform**.
   - Configurar serviços e aplicações com **Ansible** e **Docker Compose**.
   - Garantir modularidade e reutilização dos códigos de automação.

2. **Ambiente de Desenvolvimento Completo**
   - Instalar e configurar bancos de dados como **PostgreSQL** e **Redis**.
   - Gerenciar containers com **Portainer**.
   - Utilizar **Traefik** como proxy reverso e gerenciador de certificados SSL.
   - Disponibilizar dashboards de serviços com **Homer**.

3. **Monitoramento e Observabilidade**
   - Implementar **Prometheus** para coleta de métricas.
   - Integrar com **Grafana** para visualização de dados.
   - Adicionar ferramentas de monitoramento de uptime (ex: Uptime Kuma).

4. **Segurança e Gestão de Segredos**
   - Utilizar **Vault** para gerenciamento seguro de segredos e credenciais.
   - Garantir que arquivos sensíveis estejam protegidos e fora do repositório público.

5. **Ambiente Kubernetes**
   - Provisionar e configurar um cluster Kubernetes (Minikube, k3s ou kubeadm).
   - Automatizar o deploy de aplicações no cluster.
   - Integrar monitoramento e gestão de segredos no Kubernetes.

6. **Documentação e Testes**
   - Documentar todas as etapas no `README.md`, incluindo exemplos de uso.
   - Adicionar testes automatizados para playbooks Ansible e módulos Terraform (ex: Molecule).
   - Criar pipelines de CI/CD para validação e aplicação automática de mudanças.

---

## Metas Específicas

- [x] Provisionar VM base com Terraform.
- [ ] Configurar PostgreSQL e Redis com Ansible/Docker Compose.
- [ ] Instalar Portainer, Traefik e Homer para gestão e dashboard.
- [ ] Implementar monitoramento com Prometheus e Grafana.
- [ ] Configurar Vault para segredos.
- [ ] Subir cluster Kubernetes e deploy de aplicações de exemplo.
- [ ] Automatizar tarefas comuns com scripts bash.
- [ ] Documentar cada etapa e criar exemplos de uso.
- [ ] Adicionar testes automatizados para validação das configurações.

---

## Boas Práticas

- Utilizar variáveis e arquivos de configuração para valores sensíveis.
- Seguir as melhores práticas de segurança, evitando exposição de credenciais.
- Priorizar modularidade e reutilização de código.
- Validar todas as configurações antes de aplicar em produção.

---

**Este arquivo deve ser revisado e atualizado conforme o avanço do projeto.**