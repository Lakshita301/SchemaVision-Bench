-- Source: https://github.com/raed-logong/GestionAchatsVentes-Java-Swing/blob/ded59f1cb11a1ac155861946b18fd3a60eb18d9e/mysqldummydata/dummybase.sql?raw=true
-- Tables detected: 24 | FK constraints: 17
-- Foreign keys added via ALTER TABLE:
CREATE TABLE addresses_client
(
    code varchar(255) NOT NULL,
    numerorue varchar(255) NOT NULL,
    libelle varchar(255) NOT NULL,
    ville varchar(255) NOT NULL,
    codepostal varchar(255) NOT NULL,
    gouvernourat varchar(255) NOT NULL,
    pays varchar(255) NOT NULL
);

CREATE TABLE addresses_entreprise
(
    loc SMALLINT   NOT NULL,
    ville varchar(255) NOT NULL,
    codepostal varchar(255) NOT NULL,
    gouvernourat varchar(255) NOT NULL,
    pays varchar(255) NOT NULL,
    numerorue varchar(255) NOT NULL,
    libelle varchar(255) DEFAULT NULL
);

CREATE TABLE addresses_fournisseur
(
    code varchar(255) NOT NULL,
    numerorue varchar(255) NOT NULL,
    libelle varchar(255) NOT NULL,
    ville varchar(255) NOT NULL,
    codepostal varchar(255) NOT NULL,
    gouvernourat varchar(255) NOT NULL,
    pays varchar(255) NOT NULL
);

CREATE TABLE bankaccounts_client
(
    rib varchar(20)  NOT NULL,
    bankname varchar(255) NOT NULL,
    agence varchar(255) DEFAULT NULL,
    code varchar(255) NOT NULL
);

CREATE TABLE bankaccounts_entreprise
(
    rib varchar(20)  NOT NULL,
    bankname varchar(255) NOT NULL,
    agence varchar(255) NOT NULL
);

CREATE TABLE bankaccounts_fournisseur
(
    rib varchar(20)  NOT NULL,
    bankname varchar(255) NOT NULL,
    agence varchar(255) DEFAULT NULL,
    code varchar(255) NOT NULL
);

CREATE TABLE bonclient
(
    id int      NOT NULL,
    code varchar(255) NOT NULL,
    fournisseur varchar(255) NOT NULL,
    datedebon date         NOT NULL DEFAULT curdate(),
    datedereception date         NOT NULL,
    information varchar(255)          DEFAULT NULL
);

CREATE TABLE bonclient_produit
(
    id int NOT NULL,
    product_id int      DEFAULT NULL,
    bon_code varchar(255) DEFAULT NULL,
    quantite int NOT NULL
);

CREATE TABLE bonfournisseur
(
    id int      NOT NULL,
    code varchar(255) NOT NULL,
    fournisseur varchar(255) NOT NULL,
    datedebon date         NOT NULL DEFAULT curdate(),
    datedereception date         NOT NULL,
    information varchar(255)          DEFAULT NULL
);

CREATE TABLE bonfournisseur_produit
(
    id int NOT NULL,
    product_id int      DEFAULT NULL,
    bon_code varchar(255) DEFAULT NULL,
    quantite int NOT NULL
);

CREATE TABLE client
(
    code varchar(255) NOT NULL,
    matricule varchar(255) NOT NULL,
    raison varchar(255) NOT NULL,
    type varchar(255) NOT NULL,
    fax varchar(20)  NOT NULL,
    numportable varchar(20)  NOT NULL,
    numfix varchar(20)  NOT NULL,
    email varchar(255) DEFAULT NULL,
    siteweb varchar(255) DEFAULT NULL,
    etat SMALLINT   NOT NULL
);

CREATE TABLE codevalue
(
    code int NOT NULL
);

CREATE TABLE entreprise
(
    loc SMALLINT   NOT NULL DEFAULT 1,
    matricule varchar(255) NOT NULL,
    raison varchar(255) NOT NULL,
    type varchar(255) NOT NULL,
    fax varchar(20)  NOT NULL,
    numportable varchar(20)  NOT NULL,
    numfix varchar(20)  NOT NULL,
    email varchar(255)          DEFAULT NULL,
    siteweb varchar(255)          DEFAULT NULL,
    etat SMALLINT   NOT NULL,
    description varchar(255) NOT NULL
);

CREATE TABLE facturebl_bon
(
    id int      NOT NULL,
    facture_code varchar(255) NOT NULL,
    bon_code varchar(255) NOT NULL
);

CREATE TABLE factureclientbl
(
    id int      NOT NULL,
    code varchar(255) NOT NULL,
    date date DEFAULT curdate(),
    fournisseur varchar(255) NOT NULL,
    modepayment varchar(255) NOT NULL
);

CREATE TABLE factureclientbl_bon
(
    id int      NOT NULL,
    facture_code varchar(255) NOT NULL,
    bon_code varchar(255) NOT NULL
);

CREATE TABLE factureclientlibre
(
    id int      NOT NULL,
    code varchar(255) NOT NULL,
    fournisseur varchar(255) NOT NULL,
    datedebon date         NOT NULL DEFAULT curdate(),
    datedereception date         NOT NULL,
    information varchar(255)          DEFAULT NULL,
    modepayment varchar(255)          DEFAULT NULL
);

CREATE TABLE factureclient_produit
(
    id int NOT NULL,
    product_id int      DEFAULT NULL,
    bon_code varchar(255) DEFAULT NULL,
    quantite int NOT NULL
);

CREATE TABLE facturefournisseurbl
(
    id int      NOT NULL,
    code varchar(255) NOT NULL,
    date date DEFAULT curdate(),
    fournisseur varchar(255) NOT NULL,
    modepayment varchar(255) NOT NULL
);

CREATE TABLE facturefournisseurlibre
(
    id int      NOT NULL,
    code varchar(255) NOT NULL,
    fournisseur varchar(255) NOT NULL,
    datedebon date         NOT NULL DEFAULT curdate(),
    datedereception date         NOT NULL,
    information varchar(255)          DEFAULT NULL,
    modepayment varchar(255)          DEFAULT NULL
);

CREATE TABLE facturefournisseur_produit
(
    id int NOT NULL,
    product_id int      DEFAULT NULL,
    bon_code varchar(255) DEFAULT NULL,
    quantite int NOT NULL
);

CREATE TABLE familleproduit
(
    code int NOT NULL,
    designation varchar(255) DEFAULT NULL
);

CREATE TABLE fournisseur
(
    code varchar(255) NOT NULL,
    matricule varchar(255) NOT NULL,
    raison varchar(255) NOT NULL,
    type varchar(255) NOT NULL,
    fax varchar(20)  NOT NULL,
    numportable varchar(20)  NOT NULL,
    numfix varchar(20)  NOT NULL,
    email varchar(255) DEFAULT NULL,
    siteweb varchar(255) DEFAULT NULL,
    etat SMALLINT   NOT NULL
);

CREATE TABLE produit
(
    id int      NOT NULL,
    reference varchar(255) NOT NULL,
    designation varchar(255) DEFAULT NULL,
    unite varchar(255) NOT NULL,
    fournisseur varchar(255) NOT NULL,
    familleproduit int      DEFAULT NULL,
    stock int      DEFAULT NULL,
    stockminimal int      DEFAULT NULL,
    prixunitaire DOUBLE PRECISION       DEFAULT NULL,
    tva DOUBLE PRECISION       DEFAULT NULL
);


                           

ALTER TABLE addresses_client
    ADD CONSTRAINT address_client_code_fk FOREIGN KEY (code) REFERENCES client (code) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE addresses_entreprise
    ADD CONSTRAINT address_entreprise_entreprise_loc_fk FOREIGN KEY (loc) REFERENCES entreprise (loc) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE addresses_fournisseur
    ADD CONSTRAINT addresses_fournisseur_fournisseur_code_fk FOREIGN KEY (code) REFERENCES fournisseur (code) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE bankaccounts_client
    ADD CONSTRAINT bankaccounts_client_code_fk FOREIGN KEY (code) REFERENCES client (code) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE bankaccounts_fournisseur
    ADD CONSTRAINT bankaccounts_fournisseur_fournisseur_code_fk FOREIGN KEY (code) REFERENCES fournisseur (code) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE bonfournisseur_produit
    ADD CONSTRAINT bonfournisseur_produit_bonfornisseur_code_fk FOREIGN KEY (bon_code) REFERENCES bonfournisseur (code) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT bonfournisseur_produit_produit_id_fk FOREIGN KEY (product_id) REFERENCES produit (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE facturebl_bon
    ADD CONSTRAINT facturebl_bon_bonfournisseur_code_fk FOREIGN KEY (bon_code) REFERENCES bonfournisseur (code) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT facturebl_bon_facturefournisseurbl_code_fk FOREIGN KEY (facture_code) REFERENCES facturefournisseurbl (code) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE factureclientbl_bon
    ADD CONSTRAINT factureclientbl_bon_bonclient_code_fk FOREIGN KEY (bon_code) REFERENCES bonclient (code) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT factureclientbl_bon_factureclientbl_code_fk FOREIGN KEY (facture_code) REFERENCES factureclientbl (code) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE factureclient_produit
    ADD CONSTRAINT factureclient_produit_factureclientlibre_code_fk FOREIGN KEY (bon_code) REFERENCES factureclientlibre (code) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT factureclient_produit_produit_id_fk FOREIGN KEY (product_id) REFERENCES produit (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE facturefournisseur_produit
    ADD CONSTRAINT facturefournisseur_produit_facturefournisseurlibre_code_fk FOREIGN KEY (bon_code) REFERENCES facturefournisseurlibre (code) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT facturefournisseur_produit_produit_id_fk FOREIGN KEY (product_id) REFERENCES produit (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE produit
    ADD CONSTRAINT produit_fournisseur_code_fk FOREIGN KEY (fournisseur) REFERENCES fournisseur (code) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT produit_produitfamille_code_fk FOREIGN KEY (familleproduit) REFERENCES familleproduit (code) ON DELETE CASCADE ON UPDATE CASCADE;
