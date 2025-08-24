# Plano: Estrutura Centralizada de Deploy de Apps via Docker Compose

## Objetivo
Centralizar e automatizar o deploy de múltiplos aplicativos na VM utilizando Docker Compose, permitindo parametrização de exclusões de arquivos/pastas sensíveis durante a cópia dos arquivos.

## Etapas

1. **Organizar a Estrutura de Diretórios dos Apps**
   - Criar uma pasta padrão `apps/` contendo subpastas para cada app (ex: `apps/traefik`, `apps/homer`, `apps/portainer`).
   - Ferramentas: Estrutura de arquivos do projeto.
   - Resultado esperado: Diretório organizado e padronizado para todos os apps.
   - **Status:** ✅ Já implementado.

2. **Criar Papel Ansible Genérico para Deploy de Apps**
   - Desenvolver um papel chamado `docker_app` que recebe como variáveis o nome do app, caminho de origem, destino e lista de exclusões.
   - Ferramentas: Ansible.
   - Resultado esperado: Papel reutilizável para deploy de qualquer app via Docker Compose.
   - **Status:** ✅ Implementado.

3. **Definir Variáveis de Apps e Exclusões**
   - Criar um arquivo de variáveis (ex: `vars/docker_apps.yml`) listando os apps, caminhos e exclusões.
   - Ferramentas: YAML, Ansible.
   - Resultado esperado: Configuração centralizada e parametrizável dos apps e exclusões.
   - **Status:** ✅ Implementado.

4. **Implementar Task Ansible com Excludes Dinâmicos**
   - Configurar a task para usar `ansible.posix.synchronize` e aplicar os parâmetros de exclusão definidos nas variáveis.
   - Ferramentas: Ansible, rsync.
   - Resultado esperado: Cópia dos arquivos dos apps ignorando os itens sensíveis conforme parametrização.
   - **Status:** ✅ Implementado.

5. **Documentar o Processo**
   - Atualizar o `README.md` com instruções de uso, exemplos de configuração e como adicionar novos apps/exclusões.
   - Ferramentas: Markdown.
   - Resultado esperado: Documentação clara e acessível para o time.
   - **Status:** ✅ Implementado.


## Recomendações de Segurança

1. **Exclusão de arquivos sensíveis:**
   - Sempre utilize o parâmetro de exclusão para evitar copiar arquivos como volumes persistentes (`acme.json`, bancos de dados, arquivos de segredos) durante o deploy.
   - Mantenha a lista de exclusões atualizada conforme novos apps forem adicionados.

2. **Gestão de segredos e variáveis:**
   - Nunca armazene credenciais ou segredos em arquivos versionados.
   - Utilize ferramentas como Ansible Vault para proteger variáveis sensíveis.
   - Garanta que volumes de dados e arquivos de configuração sensíveis sejam criados diretamente na VM, nunca copiados do repositório.

3. **Controle de acesso:**
   - Restrinja permissões de acesso aos diretórios dos apps e aos arquivos de configuração.
   - Utilize usuários específicos para execução dos containers, evitando rodar como root.

4. **Checklist de Segurança**
   - [ ] Todos os arquivos sensíveis estão excluídos do processo de cópia?
   - [ ] As variáveis sensíveis estão protegidas com Ansible Vault ou equivalente?
   - [ ] Os volumes persistentes não são sobrescritos pelo Ansible?
   - [ ] O acesso aos diretórios dos apps está restrito?
   - [ ] A documentação orienta sobre práticas seguras de deploy?

## Próximos Passos
- Implementar o papel Ansible `docker_app`.
- Criar o arquivo de variáveis dos apps e exclusões.
- Testar o deploy de pelo menos dois apps com diferentes parâmetros de exclusão.
- Atualizar a documentação do projeto.
