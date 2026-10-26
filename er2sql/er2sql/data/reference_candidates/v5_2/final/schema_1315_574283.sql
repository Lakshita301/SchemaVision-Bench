-- Source: https://github.com/AhmedBoumekla/videotheque/blob/8e5ad86c23edc84f8920c0b0730dd52912d28cd2/creation.sql?raw=true
-- Tables detected: 10 | FK constraints: 12
create table series
(
    titreS VARCHAR(100),
    annee NUMERIC(4),
    pays VARCHAR(25),
    dateS date,
    constraint pk_series primary key(titreS,annee),
    constraint nn_series_pays check(pays is not null),
    constraint nn_series_dateS check(dateS is not null),
    constraint ck_series_annee check(annee between 1900 AND 2050)
);

create table utilisateur
(
    pseudo VARCHAR(25),
    dateI date,
    age NUMERIC(2),
    sexe VARCHAR(2),
    constraint pk_utilisateur primary key(pseudo),
    constraint nn_utilisateur_dateI check(dateI is not null),
    constraint ck_utilisateur_age check(age >= 5),
    constraint ck_utilisateur_sexe check(sexe in ('M','F'))
);

create table episode
(
    titreE VARCHAR(150),
    titreS VARCHAR(25),
    annee NUMERIC(4),
    duree NUMERIC,
    datedif date,
    resumeE VARCHAR(500),
    saison NUMERIC,
    constraint pk_episode primary key(titreE,titreS,annee,saison),
    constraint fk_episode_titreS_series foreign key (titreS,annee) references series(titreS,annee),
    constraint ck_episode_duree check(duree > 0),
    constraint ck_episode_datedif check(datedif is not null),
    constraint ck_episode_saison check(saison >=0)
);

create table staff
(
    id NUMERIC,
    nom VARCHAR(25),
    prenom VARCHAR(25),
    constraint pk_staff_ primary key(id),
    constraint nn_staff_nom check(nom is not null),
    constraint nn_staff_prenom check(prenom is not null)
);

create table forum
(
    idm NUMERIC,
    idp NUMERIC,
    titre VARCHAR(25),
    pseudo VARCHAR(25),
    commentaire VARCHAR(500),
    heure varchar(5),
    constraint pk_forum_ primary key(idm),
    constraint fk_forum_pseudo_utilisateur foreign key (pseudo) references utilisateur(pseudo),
    constraint fk_forum_idp_forum foreign key (idp) REFERENCES forum(idm)
);

create table listegenre
(
    titreS VARCHAR(25),
    annee NUMERIC(4),
    genre VARCHAR(25),
    constraint pk_liste_genre primary key(titreS,annee,genre),
    constraint fk_listegenre_titreS foreign key (titreS,annee) references series(titreS,annee)
);

create table prodcree
(
    titreS VARCHAR(25),
    annee NUMERIC(4),
    id NUMERIC,
    role VARCHAR(25),
    constraint pk_prodcree primary key(titreS,annee,id),
    constraint fk_prodcree_titreS foreign key (titreS,annee) references series(titreS,annee),
    constraint ck_prodcree_role check(role in('P','C','R')),
    constraint fk_prodcree_id foreign key (id) references staff(id)
);

create table acteur
(
    id NUMERIC,
    titreE VARCHAR(100),
    titreS VARCHAR(25),
    annee NUMERIC(4),
    saison NUMERIC,
    constraint pk_acteur primary key(id,titreE,titreS,annee,saison),
    constraint fk_acteur_id foreign key (id) references staff(id),
    constraint fk_acteur_titreE foreign key (titreE,titreS,annee,saison) references episode(titreE,titreS,annee,saison)
);

create table noteS
(
    titreS VARCHAR(25),
    annee NUMERIC(4),
    pseudo VARCHAR(25),
    note NUMERIC(2),
    commentaire VARCHAR(500),
    constraint pk_note primary key(titreS,annee,note,pseudo),
    constraint fk_noteS_titreS foreign key (titreS,annee) references series(titreS,annee),
    constraint fk_noteS_pseudo foreign key (pseudo) references utilisateur(pseudo),
    constraint ck_noteS_note check(note >=0 AND note<=10)
);

create table noteE
(
    titreE VARCHAR(100),
    titreS VARCHAR(25),
    saison NUMERIC,
    annee NUMERIC(4),
    pseudo VARCHAR(25),
    note NUMERIC(2),
    commentaire VARCHAR(500),
    constraint pk_noteE primary key(titreE,titreS,annee,pseudo,note,saison),
    constraint fk_noteE_titreS foreign key (titreE,titreS,annee,saison) references episode(titreE,titreS,annee,saison),
    constraint fk_noteE_pseudo foreign key (pseudo) references utilisateur(pseudo),
    constraint ck_noteE_note check(note >=0 and note <=10)
);
