# 📦 Projeto ECOMMERCE — Banco de Dados SQL

Bem-vindo ao projeto de banco de dados para um sistema de **ecommerce**!  😊
Este projeto representa o modelo de banco de dados para um sistema de ecommerce completo, que abrange desde o cadastro de clientes e produtos até o gerenciamento de pedidos, estoque, fornecedores, vendedores e entregas.
Ele foi criado para servir como base estrutural robusta, permitindo a gestão integrada de informações essenciais para operações comerciais online, contemplando tanto aspectos comerciais (como vendas, pagamentos e entregas) quanto administrativos (departamentos, funcionários, salários e histórico de alterações).

O modelo inclui:

- Estrutura relacional normalizada, que mantém a integridade dos dados e facilita consultas eficientes.
- Dados de exemplo para ilustrar o funcionamento e permitir testes rápidos.
- Views para relatórios consolidados, facilitando a análise de informações como número de funcionários por departamento, status de pedidos e dados gerenciais.
- Triggers que garantem automação de tarefas importantes, como auditoria de exclusão de clientes e logs de atualização salarial.
- Stored Procedure para simplificar operações CRUD nos clientes, centralizando lógica e facilitando o uso.
- Controle de acesso baseado em usuários com permissões específicas para proteger dados sensíveis e garantir segurança na consulta.

---

## 🗂 Estrutura do Banco de Dados

### Tabelas Principais

| Tabela               | Descrição                                                    |
|----------------------|--------------------------------------------------------------|
| `clients`            | Cadastro de clientes (pessoas físicas e jurídicas)           |
| `product`            | Produtos, categorias, avaliações                              |
| `orders`             | Pedidos realizados pelos clientes                             |
| `productStorage`     | Estoques e localização dos produtos                           |
| `supplier`           | Fornecedores                                                 |
| `seller`             | Vendedores                                                  |
| `productSeller`      | Relação entre vendedores e produtos                           |
| `productOrder`       | Produtos associados aos pedidos                               |
| `storageLocation`    | Locais de armazenamento                                       |
| `productSupplier`    | Produtos fornecidos por fornecedores                          |
| `client_pf`          | Dados específicos para clientes pessoa física (CPF)          |
| `payment_methods`    | Métodos de pagamento usados nos pedidos                      |
| `delivery`           | Informações de entrega e status                               |
| `departments`        | Departamentos da empresa                                      |
| `employees`          | Funcionários e suas relações com departamentos                |

---

## ⚡ Índices Criados

Para garantir desempenho nas consultas e integridade, foram criados índices como:

- `idx_clients_cpf` — Pesquisa rápida por CPF (único).
- `idx_product_category` — Busca eficiente por categoria.
- `idx_orders_idOrderClient` — Filtragem de pedidos por cliente.
- `idx_productOrder_idPOorder` — Produtos por pedido.
- `idx_productSupplier_idPsProduct` — Produtos por fornecedor.
- `idx_product_Pname` — Pesquisa por nome de produto.
- `idx_delivery_status` — Consulta por status de entrega.
- `idx_orders_status` — Busca por status do pedido.
- `idx_department_city` — Agrupamento por cidade do departamento.
- `idx_employee_department` — Funcionários por departamento.

---

## 📝 Dados de Exemplo

O banco já contém dados inseridos para facilitar testes:

- Clientes com CPF e endereço detalhado.
- Produtos variados com categorias e avaliações.
- Pedidos com status, descrição e formas de pagamento diferentes.
- Estoques distribuídos em várias localidades.
- Vínculo entre produtos, fornecedores e vendedores.
- Departamentos da empresa com seus respectivos funcionários.
- Métodos de pagamento e entregas com status atualizados.

---

## 🔍 Views para Consultas Avançadas

Para facilitar análises e relatórios, foram criadas algumas views como por exemplo:

| View                                 | Descrição                                            |
|-------------------------------------|------------------------------------------------------|
| `vw_employees_by_department_city`   | Número de funcionários por departamento e cidade     |
| `vw_departments_and_managers`        | Departamentos e seus gerentes (funcionário com menor ID) |
| `vw_projects_by_employee_count`      | Departamentos ordenados pelo número de empregados    |
| `vw_projects_departments_managers`   | Lista completa de departamentos e gerentes           |
| `vw_employees_with_dependents_and_manager_status` | Funcionários com dependentes e status de gerente     |

> **Nota:** A tabela `dependents` foi criada para armazenar dependentes dos funcionários.

---

## ⚙️ Triggers Automatizadas

- **before_delete_client:** Registra histórico antes da exclusão de um cliente em `deleted_clients_history`.
- **before_update_salary:** Armazena logs de alteração salarial em `salary_update_log` com data e valores antigos e novos.

---

## 🔄 Procedure para Gerenciamento de Clientes

A procedure `sp_manage_clients` permite:

| Ação     | Código | Descrição                             |
|----------|--------|-------------------------------------|
| SELECT   | 1      | Busca cliente(s), 0 para todos      |
| UPDATE   | 2      | Atualiza cliente existente           |
| DELETE   | 3      | Remove cliente pelo ID               |
| INSERT   | 4      | Insere novo cliente                  |

> A procedure dispara erro personalizado para ações inválidas.

---

## 🔐 Controle de Permissões

| Usuário   | Acesso                                                             |
|-----------|-------------------------------------------------------------------|
| **gerente**  | Permissão para consultar todas as views relacionadas a funcionários e departamentos |
| **funcionario** | Acesso restrito a view com informações limitadas de empregados e dependentes    |

---

## 🚀 Como Usar este Projeto

1. Importe o script SQL no seu servidor MySQL ou MariaDB.
2. Execute as instruções na sequência: criação do banco, tabelas, índices, inserção de dados, views, triggers, procedures e usuários.
3. Utilize a procedure `sp_manage_clients` para operações CRUD de clientes de forma simples e centralizada.
4. Realize consultas rápidas e consolidadas através das views.
5. Controle o acesso aos dados via usuários com permissões específicas.

---

## ⚠️ Observações Importantes

- CPF e CNPJ são tratados como `CHAR` fixos para garantir integridade.
- Enumerações garantem valores válidos para categorias e status.
- Chaves primárias são `auto_increment`.
- Estrutura flexível para adaptações futuras conforme requisitos do sistema.
- Recomendamos backups regulares e cuidados com dados sensíveis.


