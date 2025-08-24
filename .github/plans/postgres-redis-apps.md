# Plano: Configuração Centralizada de PostgreSQL e Redis via Ansible/Docker Compose

## Objetivo
Automatizar a implantação dos bancos de dados PostgreSQL e Redis na VM utilizando Ansible e Docker Compose, garantindo segurança, modularidade e facilidade de manutenção.

## Etapas

1. **Organizar a Estrutura dos Apps**
   - Criar subpastas `apps/postgres` e `apps/redis` contendo os respectivos arquivos `docker-compose.yml` e configurações necessárias.
   - Ferramentas: Estrutura de arquivos do projeto.
   - Resultado esperado: Diretórios organizados para cada serviço.

2. **Criar docker-compose.yml para PostgreSQL e Redis**
   - Definir imagens, volumes, variáveis de ambiente e configurações seguras.
   - Ferramentas: Docker Compose.
   - Resultado esperado: Arquivos prontos para deploy automatizado.

3. **Configurar papel Ansible para deploy dos apps**
   - Utilizar o papel genérico `docker_app` para copiar arquivos e subir containers.
   - Ferramentas: Ansible.
   - Resultado esperado: Deploy automatizado e padronizado.

4. **Definir variáveis de exclusão para arquivos sensíveis**
   - Adicionar parâmetros de exclusão para arquivos como dumps, logs e configs sensíveis.
   - Ferramentas: YAML, Ansible.
   - Resultado esperado: Segurança reforçada no processo de cópia.

5. **Testar o deploy dos bancos**
   - Validar se os containers sobem corretamente e estão acessíveis.
   - Ferramentas: Docker Compose, Ansible.
   - Resultado esperado: Serviços funcionando conforme esperado.

6. **Documentar o processo**
   - Atualizar o `README.md` com instruções de uso, exemplos de configuração e recomendações de segurança.
   - Ferramentas: Markdown.
   - Resultado esperado: Documentação clara para o time.

## Recomendações de Segurança

1. **Proteção de credenciais:**
   - Utilize variáveis de ambiente e arquivos `.env` para senhas, nunca versionando credenciais reais.
   - Proteja arquivos de configuração sensíveis com Ansible Vault.

2. **Volumes e backups:**
   - Garanta que volumes persistentes estejam fora do repositório e sejam criados diretamente na VM.
   - Exclua arquivos de backup e dumps do processo de cópia.

3. **Controle de acesso:**
   - Restrinja permissões dos diretórios dos bancos e dos arquivos de configuração.
   - Utilize usuários específicos para execução dos containers.

4. **Checklist de Segurança**
   - [ ] Credenciais protegidas e não versionadas?
   - [ ] Volumes persistentes criados na VM?
   - [ ] Arquivos sensíveis excluídos do deploy?
   - [ ] Permissões corretas nos diretórios?
   - [ ] Documentação orienta sobre práticas seguras?

## Próximos Passos
- Criar as pastas e arquivos docker-compose dos apps.
- Configurar variáveis e exclusões no Ansible.
- Testar o deploy automatizado.
- Atualizar a documentação do projeto.
