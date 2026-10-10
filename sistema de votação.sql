USE eleicoes;
SELECT DATABASE();

create table eleitor (
id_eleitor INT	PRIMARY	KEY auto_increment,
CPF varchar(11) NOT NULL unique,
TÍTULO_ELEITOR varchar(20) not null	unique,
NOME varchar(100) NOT NULL,
SEXO varchar(20),
DATA_NASCIMENTO date
);
SHOW TABLES FROM eleicoes;

CREATE TABLE Partido (
código_partido int primary key	auto_increment,
NOME varchar(100) not NULL,
SIGLA varchar(10) not NULL
);
SHOW TABLES FROM eleicoes;

CREATE TABLE cargo (
código_cargo int primary key auto_increment,
nome varchar(100) not null unique
);

SHOW TABLES FROM eleicoes;

create table candidato (
código_candidato int primary key auto_increment, 
NOME varchar(100) NOT NULL,
CÓDIGO_PARTIDO INT NOT NULL,
CÓDIGO_CARGO INT NOT NULL,

foreign key (CÓDIGO_CARGO)
	references cargo(CÓDIGO_CARGO)
);

SHOW TABLES FROM eleicoes;

 CREATE TABLE Voto (
    código_voto INT PRIMARY KEY AUTO_INCREMENT,
    código_candidato INT NOT NULL,
    data_hora DATETIME NOT NULL,
    FOREIGN KEY (codigo_candidato)
        REFERENCES Candidato(codigo_candidato)
);

SHOW TABLES FROM eleicoes;

ALTER TABLE Candidato
CHANGE COLUMN `código_candidato` codigo_candidato
INT NOT NULL AUTO_INCREMENT;

CREATE TABLE Voto (
    codigo_voto INT PRIMARY KEY AUTO_INCREMENT,
    codigo_candidato INT NOT NULL,
    data_hora DATETIME NOT NULL,
    FOREIGN KEY (codigo_candidato)
        REFERENCES Candidato(codigo_candidato)
);

SHOW TABLES FROM eleicoes;

SHOW CREATE TABLE Candidato;

DESCRIBE Partido;

ALTER TABLE Candidato
ADD CONSTRAINT fk_candidato_partido
FOREIGN KEY (`CÓDIGO_PARTIDO`)
REFERENCES Partido(`código_partido`);

SHOW CREATE TABLE Voto;