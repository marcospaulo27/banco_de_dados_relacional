CREATE DATABASE bd_sistema_bancario;

-- Criar 5 tabelas: conta corrente, conta poupanca, empréstimo pessoal, previdência complementar e pagamento de contas

CREATE TABLE conta_corrente (
    id_conta SERIAL PRIMARY KEY,
    numero_conta VARCHAR(20) NOT NULL,
    saldo NUMERIC(15, 2) NOT NULL
);

CREATE TABLE conta_poupanca (
    id_conta SERIAL PRIMARY KEY,
    numero_conta VARCHAR(20) NOT NULL,
    saldo NUMERIC(15, 2) NOT NULL
);

CREATE TABLE emprestimo_pessoal (
    id_emprestimo SERIAL PRIMARY KEY,
    numero_emprestimo VARCHAR(20) NOT NULL,
    valor NUMERIC(15, 2) NOT NULL,
    taxa_juros NUMERIC(5, 2) NOT NULL
);

CREATE TABLE previdencia_complementar (
    id_previdencia SERIAL PRIMARY KEY,
    numero_plano VARCHAR(20) NOT NULL,
    saldo_acumulado NUMERIC(15, 2) NOT NULL
);

CREATE TABLE pagamento_contas (
    id_pagamento SERIAL PRIMARY KEY,
    numero_pagamento VARCHAR(20) NOT NULL,
    valor_pagamento NUMERIC(15, 2) NOT NULL,
    data_pagamento DATE NOT NULL
);

-- Criar tabelas conforme MER (Sistema Bancario):

CREATE TABLE Cliente (
    cliente_id SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    endereco_cliente TEXT,
    telefone_cliente VARCHAR(15)
);

CREATE TABLE Conta (
    conta_id SERIAL PRIMARY KEY,
    numero_conta VARCHAR(20) NOT NULL,
    saldo NUMERIC(15, 2) NOT NULL,
    cliente_id INT REFERENCES Cliente(cliente_id),
    agencia_id INT REFERENCES Agencia(agencia_id)
);

CREATE TABLE Agencia (
    agencia_id SERIAL PRIMARY KEY,
    nome_agencia VARCHAR(100) NOT NULL,
    cidade_agencia VARCHAR(50)
);

CREATE TABLE Emprestimo (
    emprestimo_id SERIAL PRIMARY KEY,
    numero_emprestimo VARCHAR(20) NOT NULL,
    valor NUMERIC(15, 2) NOT NULL,
    conta_id INT REFERENCES Conta(conta_id)
);

CREATE TABLE Transacao (
    transacao_id SERIAL PRIMARY KEY,
    tipo_transacao VARCHAR(50) NOT NULL,
    valor NUMERIC(15, 2) NOT NULL,
    data_transacao DATE NOT NULL,
    conta_id INT REFERENCES Conta(conta_id)
);

-- Deletar as 5 tabelas criadas aleatoriamente 
DROP TABLE conta_corrente;
DROP TABLE conta_poupanca;
DROP TABLE emprestimo_pessoal;
DROP TABLE previdencia_complementar;
DROP TABLE pagamento_contas;

-- alterar as tabelas conforme o MER atualizado
ALTER TABLE Conta
ADD COLUMN tipo_conta VARCHAR(50);

ALTER TABLE Emprestimo
ADD COLUMN taxa_juros NUMERIC(5, 2);

-- Criar um esquema com o seu nome
CREATE SCHEMA Marcos;
