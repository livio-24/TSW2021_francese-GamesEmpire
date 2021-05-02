DROP DATABASE IF EXISTS storage1;
CREATE DATABASE storage1;
USE storage1;

CREATE TABLE prodotto (
id_prodotto int primary key auto_increment,
nome varchar(100) not null,
descrizione varchar(100) not null,
iva varchar(100) not null,
in_vendita boolean not null,
anno int not null,
prezzo double not null,
quantita int not null,
categoria varchar(100) not null);

insert into prodotto  (nome,descrizione,iva,in_vendita,anno,prezzo,quantita,categoria) values("ps5 digital","playstation 5 digital - 800 gb", "5", true , "2020", "400", "50", "console"), 
("fifa 21 - PS5","videogioco calcio", "5", true , "2020", "50", "40", "videogiochi"),
("cuffie fnatic","Cuffie da gioco Fnatic REACT per PS4/PC", "5", true , "2020", "60", "30", "accessori"),
("xbox one x","Xbox One X - Console 1TB", "5", true , "2020", "500", "50", "console"),
("Spider-Man Miles Morales -  PS5","videogioco azione open-world", "5", true , "2020", "50", "40", "videogiochi");