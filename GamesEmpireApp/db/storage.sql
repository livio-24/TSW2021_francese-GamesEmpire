DROP DATABASE IF EXISTS storage;
CREATE DATABASE storage;
USE storage;

CREATE TABLE metodo_pagamento( 
numero_carta int primary key,
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
carta_credito int,
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
cliente varchar(100) not null,
carta_credito int not null,
indirizzo varchar(100) not null,
cap varchar(100) not null ,
foreign key (cliente) references cliente (email)
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
	("FIFA 21", "FIFA 21 - PLAYSTATION 5", "35.99", "50", "15-10-2020", "3%", true,"C:\Users\Livio\Desktop\images", "PS5", "calcio");
