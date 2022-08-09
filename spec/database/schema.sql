CREATE DATABASE Catalog_of_Things;

CREATE TABLE IF NOT EXISTS musicalbum (
    id INT GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    genre_id INT,
    PRIMARY KEY(id),
    CONSTRAINT genre_id_fk FOREIGN KEY(genre_id) REFERENCES genre(id),
);

CREATE TABLE IF NOT EXISTS genre (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(80),
    PRIMARY KEY(id)
);
