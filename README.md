# 📊 Jornada de Transição para Análise de Dados & BI

Este repositório contém os scripts, consolidações práticas e inteligência de negócios desenvolvidos durante a minha jornada de transição de carreira para **Analista de Dados**, utilizando o **PostgreSQL** via **DBeaver** na base de dados **Chinook**.

O objetivo deste projeto é construir uma base técnica sólida em SQL, modelagem de dados e regras de negócio, servindo como biblioteca de consultas *coringa* e documentação de evolução.

---

## 🗺️ Trilha de Conteúdo e Aulas

### 📅 Dia 01: Filtros e Agrupamento Básico
- **Conceitos:** Cláusulas `SELECT`, `WHERE`, `ORDER BY` e limites de exibição.
- **Aplicação:** Filtragem de clientes por país e ordenação de produtos e faturas por valor.
- **Arquivo:** `dia-01-filtros-e-agrupamentos.sql`

---

### 📊 Dia 02: Filtros Avançados e Agregações (`HAVING`)
- **Conceitos:** Funções agregadas (`SUM`, `AVG`, `COUNT`, `MAX`, `MIN`), `GROUP BY` e filtragem em agregados com `HAVING`.
- **Aplicação:** Identificação de mercados com faturamento acentuado e cálculo de ticket médio por agrupamento.
- **Arquivo:** `dia-02-filtros-avancados-having.sql`

---

### 🔗 Dia 03: Relacionamentos e Cruzamento de Tabelas (`INNER JOIN`)
- **Conceitos:** Relacionamento entre tabelas usando chaves primárias (`PK`) e estrangeiras (`FK`).
- **Aplicação:** Junção de dados de clientes, faturas, faixas de música e álbuns para mapeamento do comportamento de compra.
- **Arquivo:** `dia-03-relacionamentos-inner-join.sql`

---

### 🔀 Dia 04: Mapeamento e Junções Não-Exclusivas (`LEFT` / `RIGHT JOIN`)
- **Conceitos:** Entendimento de relacionamentos do tipo 1:N, preservação de dados à esquerda/direita e identificação de registros nulos.
- **Aplicação:** Identificação de clientes sem compras efetuadas, faixas sem vendas e análise de portfólio inativo.
- **Arquivo:** `dia-04-mapeamento-juncao-left-join.sql`

---

### 🔤 Dia 05: Funções de Texto e Limpeza de Dados
- **Conceitos:** Padronização de strings (`UPPER`, `LOWER`), concatenação (`CONCAT`, `||`), substituição (`REPLACE`) e tratamento de nulos (`COALESCE`).
- **Aplicação:** Higienização de cadastros de clientes, tratamento de endereços e padronização de relatórios.
- **Arquivo:** `dia-05-funcoes-de-texto-e-limpeza.sql`

---

### ⏳ Dia 06: Funções de Data, Hora e Inteligência Temporal
- **Conceitos:** Decomposição com `EXTRACT()`, formatação gerencial com `TO_CHAR()`, cálculo de *aging* com `AGE()` e aritmética com `INTERVAL`.
- **Aplicação:** 
  - **Análise de Safra:** Evolução de faturamento mensal e ticket médio.
  - **Diagnóstico de Sazonalidade:** Identificação dos dias da semana com maior volume de compras.
  - **Régua de Cobrança:** Simulação de vencimentos e acompanhamento de vigência de contratos.
- **Arquivo:** `dia-06-funcoes-de-data-extract.sql`

---

## 🛠️ Tecnologias e Ferramentas
- **SGBD:** PostgreSQL
- **Interface GUI:** DBeaver
- **Base de Dados:** Chinook Database
- **Linguagem:** SQL (Structured Query Language)

---
*Repositório em constante atualização como parte do plano prático de estudos em Análise de Dados.*
