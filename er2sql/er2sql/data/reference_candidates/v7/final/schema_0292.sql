-- Source: https://github.com/superjjbh/noivos_correto/blob/abac60b4e85c8cf3fbc80aa716b34a6770e46340/BD/noivos_1901.sql?raw=true
-- Tables detected: 32 | FK/REFERENCES mentions: 4
CREATE TABLE area (
    area_id int NOT NULL,
    area_nome varchar(200) DEFAULT NULL,
    area_pos int DEFAULT '0'
);
CREATE TABLE area1 (
    area1_id int NOT NULL,
    area1_nome varchar(200) DEFAULT NULL,
    area1_pos int DEFAULT '0'
);
CREATE TABLE area2 (
    area2_id int NOT NULL,
    area2_nome varchar(200) DEFAULT NULL,
    area2_pos int DEFAULT '0'
);
CREATE TABLE cliente (
    cliente_id int NOT NULL,
    cliente_nome varchar(200) DEFAULT NULL,
    cliente_subtitulo varchar(200) DEFAULT NULL,
    cliente_descricao text NOT NULL,
    cliente_imagem varchar(200) DEFAULT NULL
);
CREATE TABLE cliente2 (
    cliente_id int NOT NULL,
    cliente_nome varchar(200) DEFAULT NULL,
    cliente_subtitulo varchar(200) DEFAULT NULL,
    cliente_descricao text NOT NULL,
    cliente_imagem varchar(200) DEFAULT NULL
);
CREATE TABLE comentario (
    comentario_id int NOT NULL,
    comentario_nome varchar(200) DEFAULT NULL,
    comentario_email varchar(200) DEFAULT NULL,
    comentario_mensagem text,
    comentario_data varchar(200) DEFAULT NULL,
    comentario_status int DEFAULT '0',
    comentario_pagina int DEFAULT NULL
);
CREATE TABLE contato (
    contato_id int NOT NULL,
    contato_email varchar(200) DEFAULT NULL,
    contato_telefone1 varchar(200) DEFAULT NULL,
    contato_endereco varchar(200) DEFAULT NULL,
    contato_long_lat varchar(200) DEFAULT NULL,
    contato_telefone2 varchar(200) DEFAULT NULL,
    contato_telefone3 varchar(200) DEFAULT NULL,
    contato_telefone4 varchar(200) DEFAULT NULL,
    contato_telefone5 varchar(200) DEFAULT NULL,
    contato_telefone6 varchar(200) DEFAULT NULL
);
CREATE TABLE depoimento (
    depoimento_id int NOT NULL,
    depoimento_nome varchar(200) DEFAULT NULL,
    depoimento_cargo varchar(200) DEFAULT NULL,
    depoimento_sobre text,
    depoimento_data varchar(200) DEFAULT NULL,
    depoimento_imagem varchar(200) DEFAULT NULL,
    depoimento_status varchar(4) DEFAULT NULL
);
CREATE TABLE foto (
    foto_id int NOT NULL,
    foto_url varchar(200) DEFAULT NULL,
    foto_pos int DEFAULT '0',
    foto_portfolio int DEFAULT NULL,
    foto_presente int DEFAULT NULL
);
CREATE TABLE icones (
    icones_id int NOT NULL,
    icones_nome varchar(200) DEFAULT NULL
);
CREATE TABLE modulo1 (
    modulo1_id int NOT NULL,
    modulo1_nome varchar(200) DEFAULT NULL,
    modulo1_subtitulo1 text,
    modulo1_status int DEFAULT '0'
);
CREATE TABLE modulo2 (
    modulo2_id int NOT NULL,
    modulo2_nome text NOT NULL,
    modulo2_nome1 text NOT NULL,
    modulo2_nome2 varchar(200) DEFAULT NULL,
    modulo2_nome3 varchar(200) DEFAULT NULL,
    modulo2_nome4 varchar(200) DEFAULT NULL,
    modulo2_nome5 varchar(200) DEFAULT NULL,
    modulo2_nome6 varchar(200) DEFAULT NULL,
    modulo2_nome7 varchar(200) DEFAULT NULL,
    modulo2_nome8 varchar(200) DEFAULT NULL,
    modulo2_status int DEFAULT NULL
);
CREATE TABLE modulo3 (
    modulo3_id int NOT NULL,
    modulo3_nome text,
    modulo3_descricao TEXT,
    modulo3_status int DEFAULT '0',
    modulo3_imagem varchar(200) DEFAULT '1'
);
CREATE TABLE modulo4 (
    modulo4_id int NOT NULL,
    modulo4_descricao text,
    modulo4_imagem varchar(200) NOT NULL,
    modulo4_status int DEFAULT NULL
);
CREATE TABLE modulo5 (
    modulo5_id int NOT NULL,
    modulo5_nome varchar(200) DEFAULT NULL,
    modulo5_descricao text,
    modulo5_status int DEFAULT NULL,
    modulo5_imagem varchar(200) DEFAULT NULL,
    modulo5_limite int DEFAULT NULL
);
CREATE TABLE modulo6 (
    modulo6_id int NOT NULL,
    modulo6_nome varchar(200) DEFAULT NULL,
    modulo6_descricao text NOT NULL,
    modulo6_nome1 text NOT NULL,
    modulo6_descricao1 text NOT NULL,
    modulo6_imagem varchar(200) DEFAULT NULL,
    modulo6_status int DEFAULT '0'
);
CREATE TABLE modulo7 (
    modulo7_id int NOT NULL,
    modulo7_nome varchar(200) DEFAULT NULL,
    modulo7_descricao text,
    modulo7_status int DEFAULT '0'
);
CREATE TABLE modulo8 (
    modulo8_id int NOT NULL,
    modulo8_nome varchar(200) DEFAULT NULL,
    modulo8_descricao text,
    modulo8_status int DEFAULT '0'
);
CREATE TABLE modulo9 (
    modulo9_id int NOT NULL,
    modulo9_nome varchar(200) DEFAULT NULL,
    modulo9_subtitulo text,
    modulo9_button varchar(200) DEFAULT NULL,
    modulo9_imagem varchar(200) NOT NULL,
    modulo9_status int DEFAULT NULL
);
CREATE TABLE modulo10 (
    modulo10_id int NOT NULL,
    modulo10_nome varchar(200) DEFAULT NULL,
    modulo10_subtitulo varchar(200) DEFAULT NULL,
    modulo10_icon varchar(200) DEFAULT NULL,
    modulo10_button varchar(200) DEFAULT NULL,
    modulo10_button1 varchar(200) DEFAULT NULL,
    modulo10_status varchar(200) DEFAULT NULL,
    modulo10_imagem varchar(200) DEFAULT NULL,
    modulo10_paginacao int DEFAULT NULL
);
CREATE TABLE modulo11 (
    modulo11_id int NOT NULL,
    modulo11_nome varchar(200) DEFAULT NULL,
    modulo11_button varchar(200) DEFAULT NULL
);
CREATE TABLE modulo_aparencia (
    modulo_aparencia_id int NOT NULL,
    modulo_aparencia_cor varchar(200) DEFAULT NULL,
    modulo_aparencia_favicon varchar(200) DEFAULT NULL,
    modulo_aparencia_logo varchar(200) DEFAULT NULL,
    modulo_aparencia_wide varchar(20) NOT NULL DEFAULT 'bwide'
);
CREATE TABLE padrinho (
    padrinho_id int NOT NULL,
    padrinho_nome varchar(200) DEFAULT NULL,
    padrinho_subtitulo varchar(200) DEFAULT NULL,
    padrinho_descricao text NOT NULL,
    padrinho_imagem varchar(200) DEFAULT NULL
);
CREATE TABLE pagina (
    pagina_id int NOT NULL,
    pagina_nome varchar(200) DEFAULT NULL,
    pagina_imagem varchar(200) DEFAULT NULL,
    pagina_descricao TEXT,
    pagina_pos int DEFAULT '0',
    pagina_area int DEFAULT NULL,
    pagina_data varchar(200) DEFAULT NULL,
    pagina_autor varchar(200) DEFAULT NULL,
    pagina_description varchar(200) DEFAULT NULL,
    pagina_keywords varchar(200) DEFAULT NULL
);
CREATE TABLE portfolio (
    portfolio_id int NOT NULL,
    portfolio_nome varchar(200) DEFAULT NULL,
    portfolio_cliente varchar(200) NOT NULL,
    portfolio_data varchar(200) DEFAULT NULL,
    portfolio_imagem varchar(200) DEFAULT NULL,
    portfolio_descricao TEXT,
    portfolio_area1 int DEFAULT NULL,
    portfolio_url varchar(200) DEFAULT NULL
);
CREATE TABLE presente (
    presente_id int NOT NULL,
    presente_nome varchar(200) DEFAULT NULL,
    presente_cliente varchar(200) NOT NULL,
    presente_data varchar(200) DEFAULT NULL,
    presente_imagem varchar(200) DEFAULT NULL,
    presente_descricao TEXT,
    presente_area2 int DEFAULT NULL,
    presente_url varchar(200) DEFAULT NULL
);
CREATE TABLE servico (
    servico_id int NOT NULL,
    servico_nome varchar(200) DEFAULT NULL,
    servico_icon varchar(200) DEFAULT NULL,
    servico_descricao text
);
CREATE TABLE site (
    site_id int NOT NULL,
    site_meta_desc text,
    site_meta_palavra varchar(200) DEFAULT NULL,
    site_meta_titulo varchar(200) DEFAULT NULL,
    site_sobre_titulo varchar(200) DEFAULT NULL,
    site_sobre varchar(200) DEFAULT NULL,
    site_logo varchar(200) DEFAULT NULL,
    site_meta_autor varchar(200) DEFAULT NULL,
    site_imagem varchar(200) DEFAULT NULL,
    site_analytics varchar(200) NOT NULL
);
CREATE TABLE slide (
    slide_id int NOT NULL,
    slide_imagem varchar(200) DEFAULT NULL,
    slide_nome varchar(200) DEFAULT NULL,
    slide_subtitulo varchar(200) DEFAULT NULL,
    slide_subtitulo1 varchar(200) DEFAULT NULL
);
CREATE TABLE smtp (
    smtp_id int NOT NULL,
    smtp_host varchar(200) DEFAULT NULL,
    smtp_username varchar(100) DEFAULT NULL,
    smtp_password varchar(100) DEFAULT NULL,
    smtp_fromname varchar(200) DEFAULT NULL,
    smtp_bcc varchar(100) DEFAULT NULL,
    smtp_replyto varchar(100) DEFAULT NULL,
    smtp_port int DEFAULT NULL
);
CREATE TABLE social (
    social_id int NOT NULL,
    social_url varchar(200) DEFAULT NULL,
    social_nome varchar(200) DEFAULT NULL,
    social_status int NOT NULL
);
CREATE TABLE usuario (
    usuario_id int NOT NULL,
    usuario_nome varchar(200) DEFAULT NULL,
    usuario_login varchar(200) DEFAULT NULL,
    usuario_email varchar(200) DEFAULT NULL,
    usuario_senha varchar(200) DEFAULT NULL,
    usuario_data varchar(200) DEFAULT NULL,
    usuario_imagem varchar(200) DEFAULT NULL
);
ALTER TABLE comentario ADD CONSTRAINT fk_comentario_pagina FOREIGN KEY (comentario_pagina) REFERENCES pagina (pagina_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE pagina ADD CONSTRAINT fk_pagina_area FOREIGN KEY (pagina_area) REFERENCES area (area_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE portfolio ADD CONSTRAINT fk_portfolio_area1 FOREIGN KEY (portfolio_area1) REFERENCES area1 (area1_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE presente ADD CONSTRAINT fk_presente_area2 FOREIGN KEY (presente_area2) REFERENCES area2 (area2_id) ON DELETE CASCADE ON UPDATE CASCADE;
