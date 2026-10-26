-- Source: https://github.com/MeAjudaDev/greenwallet-database/blob/76f61c4c1c8ed92e2f263be31194b0a943403a11/migrations/inicial.sql?raw=true
-- Tables detected: 3 | FK constraints: 3

create table users (
    id int AUTO_INCREMENT primary key,
    name varchar(100) not null,                     -- Nome do usuário
    email varchar(100) not null,                    -- Email do usuário
    password varchar(100) not null,                 -- Senha do usuário
    activation_code varchar(4),                     -- Codigo de ativação da conta / recuperação de senha
    state char default 'P',                         -- [A] Ativo / [P] Pendente / [D] Desativado (a) / [E] Excluído (a)
    created_at datetime default current_timestamp,
    last_updated_at datetime on update current_timestamp
) 
engine = INNODB 
default charset = UTF8MB4;

create table categories (
    id int AUTO_INCREMENT primary key,
    user_id int not null,                           -- Referência ao usuário que criou a categoria
    name varchar(100) not null,                     -- Nome da categoria (obrigatório)
    enabled boolean default 1 not null,             -- 1 = True = Enabled / 0 = False = Disabled
    type char not null,                             -- [E] Expense (Despesa / [R] Revenue (Receita)
    created_at datetime default current_timestamp,
    last_updated_at datetime on update current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(id)
) 
engine = INNODB 
default charset = UTF8MB4;

create table transactions (
    id int AUTO_INCREMENT primary key,
    user_id int not null,                           -- Referência ao usuário que criou a transação
    category_id int not null,                       -- Referência à categoria dessa transação
    description varchar(150) not null,              -- Descrição da transação
    value decimal(15, 2) not null,                  -- Valor da transação
    is_fixed boolean not null,
    due_date date not null,                         -- Data de vencimento ou recebimento
    type char not null,                             -- Tipo da transação: [E] Expense (Despesa) / [R] Revenue (Receita)
    created_at datetime default current_timestamp,
    last_updated_at datetime on update current_timestamp,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
)
engine = INNODB 
default charset = UTF8MB4;

