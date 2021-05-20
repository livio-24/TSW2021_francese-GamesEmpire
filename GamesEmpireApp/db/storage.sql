DROP DATABASE IF EXISTS storage;
CREATE DATABASE storage;
USE storage;

CREATE TABLE metodo_pagamento( 
numero_carta varchar(16) primary key,
scadenza_carta date not null,
titolare_carta varchar(100) not null
);

CREATE TABLE indirizzo_spedizione (
indirizzo varchar(100) ,
telefono varchar(20) not null,
cap varchar(100) ,
provincia varchar(100) not null,
nome varchar(100) not null,
cognome varchar(100) not null,
città varchar(100) not null,
primary key(indirizzo, cap) );

CREATE TABLE prodotto (
id_prodotto int primary key auto_increment,
nome varchar(100) not null,
descrizione varchar(100) not null,
descrizione_dettagliata text,
iva varchar(100) not null,
in_vendita boolean not null,
data_uscita date not null,
prezzo double not null,
quantita int not null,
immagine varchar(100) not null,
piattaforma varchar(100) not null,
genere varchar(100) not null);

CREATE TABLE cliente (
email varchar(100) primary key,
username varchar(100),
pwd varchar(100),
nome varchar(100) not null,
cognome varchar(100) not null,
data_nascita date not null,
amministratore boolean not null,
carta_credito varchar(16),
indirizzo varchar(100) ,
cap varchar(100) ,
foreign key (carta_credito) references metodo_pagamento (numero_carta)
	on update cascade on delete set null,
foreign key(indirizzo, cap) references indirizzo_spedizione(indirizzo, cap)
	on update cascade on delete set null);
    

CREATE TABLE ordine (
id_ordine int primary key AUTO_INCREMENT,
stato varchar(100) not null,
data_ordine date not null,
email varchar(100) not null,
importo_totale double not null,
carta_credito varchar(16) ,
indirizzo varchar(100) ,
cap varchar(100) ,
foreign key (email) references cliente (email)
	on update cascade on delete no action,
foreign key(carta_credito) references metodo_pagamento(numero_carta)
	on update no action on delete no action,
foreign key(indirizzo, cap) references indirizzo_spedizione(indirizzo, cap)
	on update no action on delete no action);


CREATE TABLE composizione (
id_ordine int ,
id_prodotto int,
quantita int not null,
prezzo_tot double not null,
iva varchar(100) not null,
primary key(id_ordine, id_prodotto),
foreign key (id_ordine) references ordine (id_ordine)
	on update cascade on delete cascade,
foreign key (id_prodotto) references prodotto (id_prodotto)
	on update no action on delete no action);
    

CREATE TABLE recensione( 
id_recensione int primary key auto_increment,
voto int check(voto > 0 and voto < 6),
commento varchar(1000),
data_recensione date not null,
cliente varchar(100) not null,
id_prodotto int not null,
foreign key(cliente) references cliente (email)
	on update cascade on delete no action,
foreign key(id_prodotto) references prodotto(id_prodotto)
	on update no action on delete no action
);

insert into prodotto (nome,descrizione,prezzo,quantita,data_uscita,iva,in_vendita,immagine,piattaforma,genere) values
("Spider-Man Miles Morales", "Marvel's Spider-Man Miles Morales - PlayStation 4", "45.99", "60", "2020/12/13", "3%", true,"images\\SpiderManMilesMoralesPS4.jpg", "PlayStation 4", "Avventura"),
("fifa 21", "Fifa 21 - PlayStation 5", "35.99", "50", "2020/0/13", "3%", true,"images\\fifa21PS5.jpg", "PlayStation 5", "calcio"),
("Mario Kart 8 Deluxe", "Mario Kart 8 Deluxe - Switch", "51.00", "60", "2017/4/28", "3%", true,"images\\MarioKart8Deluxe.jpg", "Nintendo Switch", "Gioco Di Guida"),
("Devil May Cry 5 - Special Edition", "Devil May Cry 5 (Special Edition) - Xbox Series", "41.00", "30", "2020/12/01", "3%", true,"images\\DevilMayCry5SpecialEditionXboxSeries.jpg", "Xbox Series", "Azione");