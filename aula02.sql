-- Criar banco de dados bd_sistema_bancario
-- Criar 5 tabelas quaisquer
-- Criar tabelas conforme MER (Sistema Bancario):
-- Deletar as 5 tabelas criadas aleatoriamente
-- alterar as tabelas conforme o MER atualizado
-- Criar um esquema com o seu nome

CREATE TABLE tabela1 (
    id SERIAL PRIMARY KEY,
    coluna1 VARCHAR(50),
    coluna2 INT
);

CREATE TABLE tabela2 (
    id SERIAL PRIMARY KEY,
    coluna1 TEXT,
    coluna2 BOOLEAN
);

CREATE TABLE tabela3 (
    id SERIAL PRIMARY KEY,
    coluna1 DATE,
    coluna2 DECIMAL(10, 2)
);

CREATE TABLE tabela4 (
    id SERIAL PRIMARY KEY,
    coluna1 TIMESTAMP,
    coluna2 VARCHAR(100)
);

CREATE TABLE tabela5 (
    id SERIAL PRIMARY KEY,
    coluna1 CHAR(10),
    coluna2 DOUBLE PRECISION
);

-- Tabela Cliente
CREATE TABLE Cliente (
    cliente_id SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    cidade_cliente VARCHAR(100),
    endereco_cliente TEXT
);

-- Tabela Conta
CREATE TABLE Conta (
    conta_id SERIAL PRIMARY KEY,
    numero_conta VARCHAR(20) UNIQUE NOT NULL,
    nome_agencia VARCHAR(100) NOT NULL,
    saldo DECIMAL(15, 2) DEFAULT 0.00,
    cliente_id INT REFERENCES Cliente(cliente_id)
);

-- Tabela Emprestimo
CREATE TABLE Emprestimo (
    emprestimo_id SERIAL PRIMARY KEY,
    numero_emprestimo VARCHAR(20) UNIQUE NOT NULL,
    nome_agencia VARCHAR(100) NOT NULL,
    valor DECIMAL(15, 2) NOT NULL,
    cliente_id INT REFERENCES Cliente(cliente_id)
);

-- Tabela Agencia
CREATE TABLE Agencia (
    agencia_id SERIAL PRIMARY KEY,
    nome_agencia VARCHAR(100) UNIQUE NOT NULL,
    cidade_agencia VARCHAR(100),
    depositos DECIMAL(15, 2) DEFAULT 0.00
);

DROP TABLE IF EXISTS tabela1 CASCADE;
DROP TABLE IF EXISTS tabela2 CASCADE;
DROP TABLE IF EXISTS tabela3 CASCADE;
DROP TABLE IF EXISTS tabela4 CASCADE;
DROP TABLE IF EXISTS tabela5 CASCADE;

-- Adicionar uma coluna "email_cliente" à tabela Cliente
ALTER TABLE Cliente ADD COLUMN email_cliente VARCHAR(100);

-- Alterar o tipo de dado da coluna "saldo" na tabela Conta
ALTER TABLE Conta ALTER COLUMN saldo TYPE NUMERIC(20, 2);

-- Adicionar uma coluna "data_emprestimo" à tabela Emprestimo
ALTER TABLE Emprestimo ADD COLUMN data_emprestimo DATE;

-- Renomear a coluna "depositos" para "total_depositos" na tabela Agencia
ALTER TABLE Agencia RENAME COLUMN depositos TO total_depositos;

-- Criar o esquema Marcos
CREATE SCHEMA Marcos;

-- Mover as tabelas para o esquema Marcos
ALTER TABLE Cliente SET SCHEMA Marcos;
ALTER TABLE Conta SET SCHEMA Marcos;
ALTER TABLE Emprestimo SET SCHEMA Marcos;
ALTER TABLE Agencia SET SCHEMA Marcos;
