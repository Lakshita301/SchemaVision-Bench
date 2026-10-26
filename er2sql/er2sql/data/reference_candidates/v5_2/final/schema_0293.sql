-- Source: https://github.com/sebaurel/apps/blob/6c22d3d5c90e0e316077440f2dfcdf50d24e3e2b/sql/sauvegarde%20appart.sebaurel.fr%202020-03-31.sql?raw=true
-- Tables detected: 13 | FK/REFERENCES mentions: 42
CREATE TABLE aliment (
    id bigint NOT NULL,
    descriptif text,
    nom character varying(40),
    photo_id bigint
);
CREATE TABLE categorie (
    id bigint NOT NULL,
    nom character varying(100)
);
CREATE TABLE commentaire (
    id bigint NOT NULL,
    body text,
    date timestamp without time zone,
    id_recette bigint,
    id_utilisateur bigint,
    title character varying(255) NOT NULL,
    valide boolean NOT NULL,
    redacteur_id bigint
);
CREATE TABLE element_collections_recette (
    id bigint NOT NULL,
    ordre integer NOT NULL
);
CREATE TABLE etape (
    descriptif text,
    titre character varying(255),
    id bigint NOT NULL,
    id_photo bigint,
    id_recette bigint
);
CREATE TABLE ingredient (
    commentaire character varying(255),
    quantite real NOT NULL,
    id bigint NOT NULL,
    id_aliment bigint,
    id_recette bigint,
    id_unite bigint DEFAULT 0
);
CREATE TABLE photo (
    id bigint NOT NULL,
    date timestamp without time zone,
    util character varying(255),
    valid boolean NOT NULL
);
CREATE TABLE recette (
    id bigint NOT NULL,
    date timestamp without time zone,
    descriptif text,
    publier boolean NOT NULL,
    titre character varying(255),
    photo_id bigint,
    utilisateur_id bigint,
    categorie_id bigint DEFAULT 1 NOT NULL
);
CREATE TABLE unite (
    id bigint NOT NULL,
    nom character varying(50),
    abreviation character varying(10)
);
CREATE TABLE utilisateur (
    id bigint NOT NULL,
    birthday timestamp without time zone,
    descriptif text,
    email character varying(100) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255) NOT NULL,
    pseudo character varying(100) NOT NULL,
    role character varying(255) NOT NULL,
    id_photo bigint,
    activate boolean DEFAULT false NOT NULL
);
CREATE TABLE utilisateur_favoris (
    utilisateur_id bigint NOT NULL,
    favoris_id bigint NOT NULL
);
CREATE TABLE utilisateur_frigo (
    utilisateur_id bigint NOT NULL,
    frigo_id bigint NOT NULL
);
CREATE TABLE verification_token (
    id bigint NOT NULL,
    expiry_date timestamp without time zone,
    token character varying(255),
    utilisateur bigint NOT NULL
);
ALTER TABLE aliment ADD CONSTRAINT aliment_photo_id_fkey FOREIGN KEY (photo_id) REFERENCES photo(id);
ALTER TABLE commentaire ADD CONSTRAINT commentaire_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES recette(id);
ALTER TABLE commentaire ADD CONSTRAINT commentaire_id_utilisateur_fkey FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id);
ALTER TABLE commentaire ADD CONSTRAINT commentaire_redacteur_id_fkey FOREIGN KEY (redacteur_id) REFERENCES utilisateur(id);
ALTER TABLE commentaire ADD CONSTRAINT fk56ql0sk6f2dwf864ca0hsmwlh FOREIGN KEY (id) REFERENCES utilisateur(id);
ALTER TABLE etape ADD CONSTRAINT etape_id_fkey FOREIGN KEY (id) REFERENCES element_collections_recette(id);
ALTER TABLE etape ADD CONSTRAINT etape_id_photo_fkey FOREIGN KEY (id_photo) REFERENCES photo(id);
ALTER TABLE etape ADD CONSTRAINT etape_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES recette(id);
ALTER TABLE ingredient ADD CONSTRAINT ingredient_id_aliment_fkey FOREIGN KEY (id_aliment) REFERENCES aliment(id);
ALTER TABLE ingredient ADD CONSTRAINT ingredient_id_fkey FOREIGN KEY (id) REFERENCES element_collections_recette(id);
ALTER TABLE ingredient ADD CONSTRAINT ingredient_id_recette_fkey FOREIGN KEY (id_recette) REFERENCES recette(id);
ALTER TABLE ingredient ADD CONSTRAINT ingredient_id_unite_fkey FOREIGN KEY (id_unite) REFERENCES unite(id);
ALTER TABLE recette ADD CONSTRAINT "recette_categorie-id-fkey" FOREIGN KEY (categorie_id) REFERENCES categorie(id);
ALTER TABLE recette ADD CONSTRAINT recette_photo_id_fkey FOREIGN KEY (photo_id) REFERENCES photo(id);
ALTER TABLE recette ADD CONSTRAINT recette_utilisateur_id_fkey FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id);
ALTER TABLE utilisateur ADD CONSTRAINT utilisateur_id_photo_fkey FOREIGN KEY (id_photo) REFERENCES photo(id);
ALTER TABLE utilisateur_favoris ADD CONSTRAINT utilisateur_favoris_favoris_id_fkey FOREIGN KEY (favoris_id) REFERENCES recette(id);
ALTER TABLE utilisateur_favoris ADD CONSTRAINT utilisateur_favoris_utilisateur_id_fkey FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id);
ALTER TABLE utilisateur_frigo ADD CONSTRAINT utilisateur_frigo_frigo_id_fkey FOREIGN KEY (frigo_id) REFERENCES aliment(id);
ALTER TABLE utilisateur_frigo ADD CONSTRAINT utilisateur_frigo_utilisateur_id_fkey FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id);
ALTER TABLE verification_token ADD CONSTRAINT verification_token_user_id_fkey FOREIGN KEY (utilisateur) REFERENCES utilisateur(id);
