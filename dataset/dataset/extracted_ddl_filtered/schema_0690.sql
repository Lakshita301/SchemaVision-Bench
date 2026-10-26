-- Source: https://github.com/JovanDjordjevic/materijali_sa_fakulteta/blob/c0916469b2c716d0feabcb67b219fea90ec9c75b/materijali%20sa%20osnovnih%20studija/4.%20godina/Projektovanje%20baza%20podataka/vezbe/cas_5/primeri/primer6.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 4

CREATE TABLE parent(
    id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE child(
    id INT NOT NULL,
    parent_id INT,
    INDEX par_ind (parent_id),
    CONSTRAINT pk_id PRIMARY KEY (id),  -- jos jedan nacin da dodamo primarni kljuc je da to uradimo pomocu constrainta pri pravljenju tabele
    CONSTRAINT fk_parent_id FOREIGN KEY (parent_id) REFERENCES parent(id)
    ON DELETE CASCADE ON UPDATE CASCADE -- ovako mozemo da navedemo sta se desava kada se nesto iz ove tabele brise/menja
                                        -- ovo se odnosi na ovaj strani kljuc, moglo je i sve u jednom redu
                                        -- DDL bas briga za razmake i nove redove, bitno je samo da stavljamo ;

CREATE TABLE parent;

CREATE TABLE child;

CREATE TABLE child;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE child DROP FOREIGN KEY fk_parent_id;

