-- 1. Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS gestao_ti_soese;
USE gestao_ti_soese;

-- 2. Tabela de Equipamentos (Ativos de TI)
CREATE TABLE equipamentos (
    id_equipamento INT AUTO_INCREMENT PRIMARY KEY,
    nome_ativo VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL, -- Ex: Computador, Projetor, Som
    localizacao VARCHAR(50) NOT NULL, -- Ex: Sala 01, Auditório, Adm
    status_equipamento VARCHAR(20) DEFAULT 'Operacional'
);

-- 3. Tabela de Chamados de Suporte
CREATE TABLE chamados (
    id_chamado INT AUTO_INCREMENT PRIMARY KEY,
    id_equipamento INT,
    descricao_problema TEXT NOT NULL,
    prioridade VARCHAR(10) DEFAULT 'Média', -- Baixa, Média, Alta
    status_chamado VARCHAR(20) DEFAULT 'Aberto', -- Aberto, Em Atendimento, Concluído
    data_abertura DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_equipamento) REFERENCES equipamentos(id_equipamento)
);

-- 4. Inserção de Dados de Teste
INSERT INTO equipamentos (nome_ativo, categoria, localizacao) VALUES 
('Projetor EPSON', 'Multimídia', 'Sala 03 - Bloco A'),
('PC Dell OptiPlex', 'Desktop', 'Secretaria Acadêmica'),
('Sistema de Som JBL', 'Áudio', 'Auditório Principal');

INSERT INTO chamados (id_equipamento, descricao_problema, prioridade, status_chamado) VALUES 
(1, 'Lâmpada do projetor piscando em vermelho', 'Alta', 'Aberto'),
(2, 'Computador não liga após queda de energia', 'Média', 'Em Atendimento'),
(1, 'Troca de cabo HDMI danificado', 'Baixa', 'Concluído');

-- 5. Consultas Úteis para Análise (Queries)

-- Consulta 1: Listar todos os chamados em aberto com os dados do equipamento
SELECT 
    c.id_chamado,
    e.nome_ativo,
    e.localizacao,
    c.descricao_problema,
    c.prioridade
FROM chamados c
JOIN equipamentos e ON c.id_equipamento = e.id_equipamento
WHERE c.status_chamado != 'Concluído';

-- Consulta 2: Contar total de chamados por categoria de equipamento
SELECT 
    e.categoria, 
    COUNT(c.id_chamado) AS total_chamados
FROM chamados c
JOIN equipamentos e ON c.id_equipamento = e.id_equipamento
GROUP BY e.categoria;