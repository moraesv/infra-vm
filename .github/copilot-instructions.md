# Instruções para o Copilot

## Diretrizes Gerais

1. **Linguagem de Resposta**:
   - Sempre responda em **português do Brasil**.

2. **Contexto do Projeto**:
   - Este projeto é voltado para infraestrutura como código, utilizando ferramentas como **Ansible**, **Terraform** e **Docker Compose**.
   - O foco principal é gerenciar e automatizar a configuração de serviços como **Homer**, **Portainer** e **Traefik**.
   - Os objetivos e planos do projeto estão definidos nos arquivos `OBJECTIVES.md` e na pasta `.github/plans`.

3. **Boas Práticas**:
   - Sempre siga as melhores práticas de segurança, como evitar expor chaves privadas ou credenciais.
   - Utilize variáveis e arquivos de configuração para valores sensíveis.
   - Garanta que recomendações de segurança estejam presentes em todos os planos e objetivos.
   - Priorize modularidade e reutilização de código, especialmente em arquivos do Ansible e Terraform.

4. **Sugestões de Código**:
   - Certifique-se de que os exemplos de código sejam claros, bem documentados e alinhados aos objetivos do projeto.
   - Sempre valide se o código ou configuração está correto e funcional antes de sugerir alterações.
   - Sugira testes para validar as mudanças, especialmente para automações e infraestrutura.

5. **Execução de Comandos**:
   - Sempre forneça comandos compatíveis com o shell **bash** no Linux.
   - Explique o propósito de cada comando sugerido.

6. **Documentação**:
   - Expanda o arquivo `README.md` com instruções detalhadas para configurar e executar o ambiente.
   - Inclua exemplos de uso para cada ferramenta (Ansible, Terraform, Docker Compose).
   - Mantenha os arquivos de documentação atualizados conforme novos planos e objetivos forem criados ou alterados.

7. **Automação**:
   - Crie scripts para automatizar tarefas comuns, como inicializar o ambiente ou aplicar mudanças no Terraform.
   - Configure pipelines de CI/CD para validar e aplicar mudanças automaticamente.

8. **Segurança**:
   - Certifique-se de que arquivos sensíveis, como `infra-vm-key`, estejam protegidos e não sejam expostos em repositórios públicos.
   - Utilize ferramentas como o `Vault` do Ansible para gerenciar segredos.
   - Sempre inclua uma seção de "Recomendações de Segurança" nos planos e objetivos.

9. **Testes**:
   - Adicione testes para validar os playbooks do Ansible e os módulos do Terraform.
   - Utilize ferramentas como `molecule` para testar os playbooks.

10. **Melhorias no Terraform**:
    - Considere dividir os arquivos do Terraform em módulos para facilitar a manutenção.
    - Adicione variáveis e outputs mais detalhados para maior flexibilidade.

---

**Observação:**  
Sempre alinhe suas sugestões e alterações aos objetivos definidos em `OBJECTIVES.md` e aos planos presentes em `.github/plans`.  
Garanta que cada plano novo ou alterado siga as diretrizes de segurança, automação, documentação e testes.
