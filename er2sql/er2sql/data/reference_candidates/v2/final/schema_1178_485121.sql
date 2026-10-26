-- Source: https://github.com/rrbalat/Pokemon/blob/789e1d621770eba75c4183b2da259ffeeaea689b/pokemon.sql?raw=true
-- Tables detected: 7 | FK constraints: 7

create table Pokemon (
	Id varchar(36) not null,
    Name varchar(50) not null,
    GenerationId varchar(36) not null,
    EvolutionPokemonId varchar(36),
    constraint PK_Pokemon_Id primary key (Id),
    constraint UC_Pokemon_Name unique (Name),
    constraint FK_Pokemon_Pokemon_EvolutionPokemonId foreign key (EvolutionPokemonId) references Pokemon(Id),
	constraint FK_Pokemon_Generation_GenerationId foreign key (GenerationId) references Generation(Id)
);

create table Generation (
	Id varchar(36) not null,
    Abrv varchar(50) not null,
	Name varchar(50) not null,
    constraint PK_Generation_Id primary key (Id)
);

create table Type(
	Id varchar(36) not null,
    Abrv varchar(50) not null,
	Name varchar(50) not null,
    constraint PK_Type_Id primary key (Id)
);

create table PokemonType(
	Id varchar(36) not null,
    PokemonId varchar(36) not null,
    TypeId varchar(36) not null,
    constraint PK_PokemonType_Id primary key (Id),
    constraint FK_PokemonType_Pokemon_PokemonId foreign key (PokemonId) references Pokemon(Id),
    constraint FK_PokemonType_Pokemon_TypeId foreign key (TypeId) references Type(Id),
	constraint UC_PokemonType_PokemonId_TypeId unique (PokemonId, TypeId)
);

create table User(
	Id varchar(36) not null,
    Name varchar(36) not null,
	constraint PK_User_Id primary key (Id),
    constraint UC_User_Name unique (Name)
);

create table UserPokemon(
	Id varchar(36) not null,
    UserId varchar(36) not null,
    PokemonId varchar(36) not null,
    LocationId varchar(36) not null,
    Favourite bool not null default false,
    Width decimal(5,2),
    Height decimal (5,2),
    Description text,
    constraint PK_UserPokemon_Id primary key (Id),
    constraint FK_UserPokemon_User_UserId foreign key (UserId) references User(Id),
    constraint FK_UserPokemon_Pokemon_PokemonId foreign key (PokemonId) references Pokemon(Id),
    constraint FK_UserPokemon_Location_LocationId foreign key (LocationId) references Location(Id)
);

create table Location(
	Id varchar(36) not null,
    Abrv varchar(50) not null,
    Name varchar(50) not null,
    constraint PK_Location_Id primary key (Id)
);

