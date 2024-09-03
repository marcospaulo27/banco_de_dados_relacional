CREATE DATABASE bd_aula03;


-- Tabela Cliente
CREATE TABLE Cliente (
    cliente_id SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    endereco_cliente TEXT,
    telefone_cliente VARCHAR(15)
);

-- Tabela Titulo
CREATE TABLE Titulo (
    titulo_id SERIAL PRIMARY KEY,
    nome_titulo VARCHAR(200) NOT NULL,
    autor_titulo VARCHAR(100),
    ano_publicacao INT
);

-- Tabela Empréstimo
CREATE TABLE Emprestimo (
    emprestimo_id SERIAL PRIMARY KEY,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    cliente_id INT REFERENCES Cliente(cliente_id),
    titulo_id INT REFERENCES Titulo(titulo_id)
);

-- Tabela Livros
CREATE TABLE Livros (
    livro_id SERIAL PRIMARY KEY,
    codigo_livro VARCHAR(20) UNIQUE NOT NULL,
    titulo_id INT REFERENCES Titulo(titulo_id),
    disponibilidade BOOLEAN DEFAULT TRUE
);

-- Domain para nome de cliente, título ou autor
CREATE DOMAIN nome_tipo AS VARCHAR(100) 
    CHECK (VALUE IS NOT NULL);

-- Domain para telefone
CREATE DOMAIN telefone_tipo AS VARCHAR(15) 
    CHECK (VALUE ~ '^[0-9]+$');  -- Somente números

-- Domain para ano de publicação
CREATE DOMAIN ano_tipo AS INT 
    CHECK (VALUE > 0 AND VALUE <= EXTRACT(YEAR FROM CURRENT_DATE));

-- Alterar a tabela Cliente para usar domains
ALTER TABLE Cliente 
    ALTER COLUMN nome_cliente SET DATA TYPE nome_tipo,
    ALTER COLUMN telefone_cliente SET DATA TYPE telefone_tipo;

-- Alterar a coluna autor_titulo para usar o domain nome_tipo
ALTER TABLE Titulo 
    ALTER COLUMN autor_titulo SET DATA TYPE nome_tipo;

-- Alterar a coluna ano_publicacao para usar o domain ano_tipo
ALTER TABLE Titulo 
    ALTER COLUMN ano_publicacao SET DATA TYPE ano_tipo;

-- Adicionar restrição CHECK para garantir que nome_titulo não seja vazio
ALTER TABLE Titulo 
    ADD CONSTRAINT chk_nome_titulo CHECK (LENGTH(nome_titulo) > 0);


-- Adicionar chave estrangeira na tabela Emprestimo para Cliente
ALTER TABLE Emprestimo 
    ADD CONSTRAINT fk_cliente_emprestimo
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id);

-- Adicionar chave estrangeira na tabela Emprestimo para Titulo
ALTER TABLE Emprestimo 
    ADD CONSTRAINT fk_titulo_emprestimo
    FOREIGN KEY (titulo_id) REFERENCES Titulo(titulo_id);

-- Adicionar chave estrangeira na tabela Livros para Titulo
ALTER TABLE Livros 
    ADD CONSTRAINT fk_titulo_livro
    FOREIGN KEY (titulo_id) REFERENCES Titulo(titulo_id);
