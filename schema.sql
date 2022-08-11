CREATE DATABASE Catalog_of_Things;

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

CREATE TABLE IF NOT EXISTS musicalbum (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    genre_id INT,
    CONSTRAINT genre_id_fk FOREIGN KEY(genre_id) REFERENCES genre(id)
);

CREATE TABLE IF NOT EXISTS genre (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(80),
    PRIMARY KEY(id)
);

CREATE TABLE books (
    id           INT GENERATED ALWAYS AS IDENTITY,
    publisher    VARCHAR(255),
    cover_sate   VARCHAR(255),
    publish_date DATE,
    archived     BOOLEAN,
    label_id     INT 
    PRIMARY KEY(id)
);

CREATE TABLE labels (
    id           INT GENERATED ALWAYS AS IDENTITY,
    title    VARCHAR(255),
    color   VARCHAR(255), 
    PRIMARY KEY(id)
);

ALTER TABLE books ADD FOREIGN KEY (label_id) REFERENCES labels(id) ON DELETE CASCADE;

CREATE INDEX index_label_id ON books (label_id);
