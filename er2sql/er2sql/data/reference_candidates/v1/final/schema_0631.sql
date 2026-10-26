-- Source: https://github.com/OliverHerna/Bases-De-Datos-ESCOM/blob/7205521ae18caa9888494d41399c58c31641c29a/CLASES/Periodo1/05_11_20/card_N_N_CHEN_AUTOBUS.SQL?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4
create table autobus(
    id_matricula number(5),
    traj_circ number (5),
    categoria VARCHAR(10),
    constraint autobus_pk  primary key (id_matricula)
);

create table conductor (
    id_conductor number (5),
    nombre VARCHAR(10),
    experiencia VARCHAR(10),
    constraint conductor_pk primary key (id_conductor)
);

create table condu_auto(
    id_conductor number (5),
    id_matricula number (5),
    trayecto VARCHAR(10),
    constraint candu_auto_pk     
					primary key (id_conductor,id_matricula),
    constraint condu_auto_Id_cond_fk 
					foreign key (id_conductor) references
					conductor (id_conductor),
    constraint condu_auto_Id_matri_fk 
					foreign key (id_matricula) references
					autobus (id_matricula)
);
