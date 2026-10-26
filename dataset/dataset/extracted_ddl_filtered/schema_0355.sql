-- Source: https://github.com/Wylhem/livraison/blob/625b228f873fafbb4c3c72ac02c4935107e0ec89/JMerise/projet-postgres.sql?raw=true
-- Tables detected: 9 | FK/REFERENCES mentions: 26

CREATE TABLE public.Adress(
	id_adress   SERIAL NOT NULL ,
	adress      VARCHAR (256) NOT NULL ,
	city        VARCHAR (64) NOT NULL ,
	CP          INT  NOT NULL  ,
	CONSTRAINT Adress_PK PRIMARY KEY (id_adress)
)WITHOUT OIDS;

CREATE TABLE public.Utilisateur(
	id_user         SERIAL NOT NULL ,
	email           VARCHAR (128) NOT NULL ,
	pseudo          VARCHAR (64) NOT NULL ,
	name            VARCHAR (64) NOT NULL ,
	forname         VARCHAR (64) NOT NULL ,
	hashmdp         VARCHAR (256) NOT NULL ,
	resetPWDToken   VARCHAR (256)  ,
	id_adress       INT    ,
	CONSTRAINT Utilisateur_PK PRIMARY KEY (id_user)

	,CONSTRAINT Utilisateur_Adress_FK FOREIGN KEY (id_adress) REFERENCES public.Adress(id_adress)
)WITHOUT OIDS;

CREATE TABLE public.FruitLegume(
	id_fruit       SERIAL NOT NULL ,
	nom_fruit      VARCHAR (64) NOT NULL ,
	prix_produit   DECIMAL (15,3) NOT NULL  ,
	CONSTRAINT FruitLegume_PK PRIMARY KEY (id_fruit)
)WITHOUT OIDS;

CREATE TABLE public.Livraison(
	id_livraison   SERIAL NOT NULL ,
	date_envoi     DATE  NOT NULL ,
	id_user        INT  NOT NULL ,
	id_adress      INT  NOT NULL  ,
	CONSTRAINT Livraison_PK PRIMARY KEY (id_livraison)

	,CONSTRAINT Livraison_Utilisateur_FK FOREIGN KEY (id_user) REFERENCES public.Utilisateur(id_user)
	,CONSTRAINT Livraison_Adress0_FK FOREIGN KEY (id_adress) REFERENCES public.Adress(id_adress)
)WITHOUT OIDS;

CREATE TABLE public.CommandeHebdomadaire(
	id_commande_hebdo   SERIAL NOT NULL ,
	id_user             INT  NOT NULL  ,
	CONSTRAINT CommandeHebdomadaire_PK PRIMARY KEY (id_commande_hebdo)

	,CONSTRAINT CommandeHebdomadaire_Utilisateur_FK FOREIGN KEY (id_user) REFERENCES public.Utilisateur(id_user)
)WITHOUT OIDS;

CREATE TABLE public.Commande(
	id_commande         SERIAL NOT NULL ,
	date_commande       DATE  NOT NULL ,
	is_payed            BOOL  NOT NULL ,
	id_user             INT  NOT NULL ,
	id_livraison        INT   ,
	id_commande_hebdo   INT    ,
	CONSTRAINT Commande_PK PRIMARY KEY (id_commande)

	,CONSTRAINT Commande_Utilisateur_FK FOREIGN KEY (id_user) REFERENCES public.Utilisateur(id_user)
	,CONSTRAINT Commande_Livraison0_FK FOREIGN KEY (id_livraison) REFERENCES public.Livraison(id_livraison)
	,CONSTRAINT Commande_CommandeHebdomadaire1_FK FOREIGN KEY (id_commande_hebdo) REFERENCES public.CommandeHebdomadaire(id_commande_hebdo)
)WITHOUT OIDS;

CREATE TABLE public.AdressSave(
	id_user     INT  NOT NULL ,
	id_adress   INT  NOT NULL  ,
	CONSTRAINT AdressSave_PK PRIMARY KEY (id_user,id_adress)

	,CONSTRAINT AdressSave_Utilisateur_FK FOREIGN KEY (id_user) REFERENCES public.Utilisateur(id_user)
	,CONSTRAINT AdressSave_Adress0_FK FOREIGN KEY (id_adress) REFERENCES public.Adress(id_adress)
)WITHOUT OIDS;

CREATE TABLE public.DansCommande(
	id_fruit      INT  NOT NULL ,
	id_commande   INT  NOT NULL ,
	NB_FRUIT      INT  NOT NULL  ,
	CONSTRAINT DansCommande_PK PRIMARY KEY (id_fruit,id_commande)

	,CONSTRAINT DansCommande_FruitLegume_FK FOREIGN KEY (id_fruit) REFERENCES public.FruitLegume(id_fruit)
	,CONSTRAINT DansCommande_Commande0_FK FOREIGN KEY (id_commande) REFERENCES public.Commande(id_commande)
)WITHOUT OIDS;

CREATE TABLE public.EnStock(
	id_user    INT  NOT NULL ,
	id_fruit   INT  NOT NULL ,
	NB_FRUIT   INT  NOT NULL  ,
	CONSTRAINT EnStock_PK PRIMARY KEY (id_user,id_fruit)

	,CONSTRAINT EnStock_Utilisateur_FK FOREIGN KEY (id_user) REFERENCES public.Utilisateur(id_user)
	,CONSTRAINT EnStock_FruitLegume0_FK FOREIGN KEY (id_fruit) REFERENCES public.FruitLegume(id_fruit)
)WITHOUT OIDS;

