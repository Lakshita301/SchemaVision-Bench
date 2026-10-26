-- Source: https://github.com/AhmedBoumekla/videotheque/blob/8e5ad86c23edc84f8920c0b0730dd52912d28cd2/creation.sql?raw=true
-- Tables detected: 10 | FK constraints: 12

create table series
(
	titreS varchar2(100),
	annee number(4),
	pays varchar2(25),
	dateS date,
	constraint pk_series primary key(titreS,annee),
	constraint nn_series_pays check(pays is not null),
	constraint nn_series_dateS check(dateS is not null),
	constraint ck_series_annee check(annee between 1900 AND 2050)
);

create table utilisateur
(
	pseudo varchar2(25),
	dateI date,
	age number(2),
	sexe varchar2(2),
	constraint pk_utilisateur primary key(pseudo),
	constraint nn_utilisateur_dateI check(dateI is not null),
	constraint ck_utilisateur_age check(age >= 5),
	constraint ck_utilisateur_sexe check(sexe in ('M','F'))
);

create table episode
(
	titreE varchar2(150),
    titreS varchar2(25),
    annee number(4),
	duree number,
	datedif date,
	resumeE varchar2(500),
	saison number,
	constraint pk_episode primary key(titreE,titreS,annee,saison),
    constraint fk_episode_titreS_series foreign key (titreS,annee) references series(titreS,annee),
	constraint ck_episode_duree check(duree > 0),
	constraint ck_episode_datedif check(datedif is not null),
	constraint ck_episode_saison check(saison >=0)
);

create table staff
(
	id number,
	nom varchar2(25),
	prenom varchar2(25),
	constraint pk_staff_ primary key(id),
	constraint nn_staff_nom check(nom is not null),
	constraint nn_staff_prenom check(prenom is not null)
);

create table forum
(
	idm number,
	idp number,
	titre varchar2(25),
	pseudo varchar2(25),
    commentaire varchar2(500),
	heure varchar(5),
	constraint pk_forum_ primary key(idm),
	constraint fk_forum_pseudo_utilisateur foreign key (pseudo) references utilisateur(pseudo),
	constraint fk_forum_idp_forum foreign key (idp) REFERENCES forum(idm)
);

create table listegenre
(
	titreS varchar2(25),
    annee number(4),
	genre varchar2(25),
	constraint pk_liste_genre primary key(titreS,annee,genre),
    constraint fk_listegenre_titreS foreign key (titreS,annee) references series(titreS,annee)
);

create table prodcree
(
    titreS varchar2(25),
    annee number(4),
    id number,
    role varchar2(25),
    constraint pk_prodcree primary key(titreS,annee,id),
    constraint fk_prodcree_titreS foreign key (titreS,annee) references series(titreS,annee),
    constraint ck_prodcree_role check(role in('P','C','R')),
    constraint fk_prodcree_id foreign key (id) references staff(id)
    
);

create table acteur
(
    id number,
    titreE varchar2(100),
    titreS varchar2(25),
    annee number(4),
    saison number,
    constraint pk_acteur primary key(id,titreE,titreS,annee,saison),
    constraint fk_acteur_id foreign key (id) references staff(id),
    constraint fk_acteur_titreE foreign key (titreE,titreS,annee,saison) references episode(titreE,titreS,annee,saison)
);

create table noteS
(
    titreS varchar2(25),
    annee number(4),
    pseudo varchar2(25),
	note number(2),
    commentaire varchar2(500),
    constraint pk_note primary key(titreS,annee,note,pseudo),
    constraint fk_noteS_titreS foreign key (titreS,annee) references series(titreS,annee),
    constraint fk_noteS_pseudo foreign key (pseudo) references utilisateur(pseudo),
	constraint ck_noteS_note check(note >=0 AND note<=10)
);

create table noteE
(
    titreE varchar2(100),
    titreS varchar2(25),
    saison number,
    annee number(4),
    pseudo varchar2(25),
	note number(2),
    commentaire varchar2(500),
    constraint pk_noteE primary key(titreE,titreS,annee,pseudo,note,saison),
    constraint fk_noteE_titreS foreign key (titreE,titreS,annee,saison) references episode(titreE,titreS,annee,saison),
    constraint fk_noteE_pseudo foreign key (pseudo) references utilisateur(pseudo),
	constraint ck_noteE_note check(note >=0 and note <=10)
);

