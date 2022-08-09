CREATE DATABASE my_catalog;

CREATE TABLE authors (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
);

CREATE TABLE games (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    author_id int,
    multiplayer VARCHAR(100),
    last_played_at DATE,
    FOREIGN KEY(author_id) REFERENCES authors(id)
);
