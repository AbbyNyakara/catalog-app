CREATE DATABASE catalog;
USE catalog;

CREATE TABLE item (
	id INT NOT NULL auto_increment,
    publish_date DATE,
    archived boolean
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
	publisher VARCHAR(30),
    cover_state VARCHAR(30)
);

CREATE TABLE musicAlbum (
	on_spotify BOOLEAN
);

CREATE TABLE movie (
	silet BOOLEAN
);

CREATE TABLE game (
	multiplayer VARCHAR(30),
  last_played_at DATE
)