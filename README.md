# 🛠️ Sistema de Gestão de Chamados e Ativos de TI (SQL)

Este projeto apresenta a modelagem e implementação de um banco de dados relacional (MySQL) para o controle de equipamentos e chamados de suporte técnico em ambiente corporativo/institucional.

---

## 📌 Problema Resolvido
Em ambientes com grande volume de usuários e ativos tecnológicos, o controle manual de equipamentos e manutenções gera falhas de acompanhamento. Este banco de dados resolve essa dor ao relacionar os ativos de TI diretamente aos seus incidentes reportados, permitindo rastrear o histórico de manutenção de cada equipamento.

---

## 🏗️ Estrutura do Banco de Dados

O sistema é composto por duas tabelas principais com relacionamento de Chave Estrangeira (FK):

* **`equipamentos`**: Registra os ativos de TI (computadores, projetores, som, etc.), sua localização física e status atual.
* **`chamados`**: Registra as solicitações de manutenção associadas aos equipamentos, com nível de prioridade e status de atendimento.

---

## 🔍 Consultas Desenvolvidas (Queries)

O arquivo `sistema_chamados.sql` inclui consultas focadas em tomada de decisão operacional:
1. **Filtro de Chamados Ativos:** Relaciona chamados pendentes com a localização física exata do equipamento (utilizando `JOIN`).
2. **Métricas por Categoria:** Agrupa e conta os incidentes por tipo de tecnologia (utilizando `GROUP BY` e `COUNT`).

---

## 🚀 Tecnologias Utilizadas
* **Linguagem:** SQL (DDL e DML)
* **SGBD:** MySQL / MariaDB

---

## 💻 Como executar o script
1. Abra o seu SGBD de preferência (MySQL Workbench, phpMyAdmin ou DBeaver).
2. Importe e execute o arquivo `sistema_chamados.sql`.
3. As tabelas serão criadas e populadas com dados de teste para execução das consultas.
