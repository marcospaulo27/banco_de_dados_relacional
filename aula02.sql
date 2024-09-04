-- Criar banco de dados bd_sistema_bancario
CREATE DATABASE bd_sistema_bancario;

-- Criar 5 tabelas quaisquer: conta corrente, conta poupanca, empréstimo pessoal, previdência complementar e pagamento de contas

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

CREATE TABLE cliente (
    cliente_id SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    endereco_cliente TEXT,
    telefone_cliente VARCHAR(15)
);

CREATE TABLE agencia (
    agencia_id SERIAL PRIMARY KEY,
    nome_agencia VARCHAR(100) NOT NULL,
    cidade_agencia VARCHAR(50)
);

CREATE TABLE conta (
    conta_id SERIAL PRIMARY KEY,
    numero_conta VARCHAR(20) NOT NULL,
    saldo NUMERIC(15, 2) NOT NULL,
    cliente_id INT REFERENCES cliente(cliente_id),
    agencia_id INT REFERENCES agencia(agencia_id)
);


CREATE TABLE emprestimo (
    emprestimo_id SERIAL PRIMARY KEY,
    numero_emprestimo VARCHAR(20) NOT NULL,
    valor NUMERIC(15, 2) NOT NULL,
    conta_id INT REFERENCES Conta(conta_id)
);

-- Deletar as 5 tabelas criadas aleatoriamente 

DROP TABLE conta_corrente;
DROP TABLE conta_poupanca;
DROP TABLE emprestimo_pessoal;
DROP TABLE previdencia_complementar;
DROP TABLE pagamento_contas;

-- alterar as tabelas conforme o MER atualizado

ALTER TABLE cliente rename to tbl_cliente;
ALTER TABLE conta rename to tbl_conta;
ALTER TABLE emprestimo rename to tbl_emprestimo;
ALTER TABLE agencia rename to tbl_agencia;

ALTER TABLE tbl_cliente ADD COLUMN idade int;
ALTER TABLE tbl_cliente ADD COLUMN cpf int;

-- Criar um esquema com o seu nome

CREATE SCHEMA Marcos;

