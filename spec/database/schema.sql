CREATE DATABASE catalog_of_things;

CREATE TABLE IF NOT EXISTS musicalbum (
    id INT GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    genre_id INT,
    PRIMARY KEY(id),
    CONSTRAINT genre_id_fk FOREIGN KEY(genre_id) REFERENCES genre(id),
);
