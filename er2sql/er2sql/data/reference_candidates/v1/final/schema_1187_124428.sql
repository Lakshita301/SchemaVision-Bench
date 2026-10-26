-- Source: https://github.com/romulovieira777/Bancos_de_Dados_SQL_e_NoSQL/blob/54d85e57847d2181d9e305b63010ebd0e8943e7b/Se%C3%A7%C3%A3o%2006%20-%20MySQL%20-%20Parte%201/Pr%C3%A1tica%20da%20Se%C3%A7%C3%A3o/secao_05_part_03.sql?raw=true
-- Tables detected: 3 | FK constraints: 1

CREATE TABLE profissoes
(
	id INT NOT NULL AUTO_INCREMENT
  , cargo VARCHAR(60) NOT NULL
  , PRIMARY KEY (id)
);

CREATE TABLE clientes 
(
	id INT NOT NULL AUTO_INCREMENT
  , nome VARCHAR(60) NOT NULL
  , data_nascimento DATE NOT NULL
  , telefone VARCHAR(10) NOT NULL
  , id_profissao INT NOT NULL
  , PRIMARY KEY (id)
  , FOREIGN KEY (id_profissao) REFERENCES profissoes (id)
);

CREATE TABLE consumidores 
(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
  , nome VARCHAR(50) NOT NULL
  , contato VARCHAR(50) NOT NULL
  , endereco VARCHAR(100) NOT NULL
  , cidade VARCHAR(100) NOT NULL
  , cep VARCHAR(20) NOT NULL
  , pais VARCHAR(50) NOT NULL
);

