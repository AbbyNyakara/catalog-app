CREATE DATABASE catalog;
USE catalog;

CREATE TABLE item (
	id INT NOT NULL auto_increment,
    publish_date DATE,
    archived boolean, 
    genre INT NOT NULL,
    author INT NOT NULL,
    source INT NOT NULL,
    label INT NOT NULL,
    foreign key(genre) REFERENCES genre(id),
	foreign key(author) REFERENCES author(id),
	foreign key(source) REFERENCES source(id),
	foreign key(label) REFERENCES label(id)
);

CREATE TABLE genre (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    items VARCHAR(30)
);

CREATE TABLE author (
	id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    items VARCHAR(50)
);

CREATE TABLE source (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    items VARCHAR(30)
);

CREATE TABLE label (
	id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(30),
    color VARCHAR(30),
    items VARCHAR(30)
);

CREATE TABLE book (
	id INT NOT NULL AUTO_INCREMENT,
	publisher VARCHAR(30),
    cover_state VARCHAR(30),
    publish_date DATE,
    archived boolean
);

CREATE TABLE musicAlbum (
	id INT NOT NULL AUTO_INCREMENT,
	on_spotify BOOLEAN,
    publish_date DATE,
    archived boolean
);

CREATE TABLE movie (
	id INT NOT NULL AUTO_INCREMENT,
	silet BOOLEAN,
    publish_date DATE,
    archived boolean
);

CREATE TABLE game (
	id INT NOT NULL AUTO_INCREMENT,
	multiplayer VARCHAR(30),
    last_played_at DATE,
    publish_date DATE,
    archived boolean
);
