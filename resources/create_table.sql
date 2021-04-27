CREATE TABLE album
(
    id           int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title        varchar(255),
    artist_name  varchar(255),
    release_year int
);

CREATE TABLE track
(
    id       int NOT NULL,
    id_album int NOT NULL,
    title    varchar(255),
    duration int,
    PRIMARY KEY (id, id_album),
    CONSTRAINT fk_album FOREIGN KEY (id_album) REFERENCES album (id)
);
