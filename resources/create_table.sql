CREATE TABLE album
(
    id           int unsigned NOT NULL AUTO_INCREMENT,
    title        varchar(255) DEFAULT NULL,
    artist_name  varchar(255) DEFAULT NULL,
    release_year int unsigned DEFAULT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE track
(
    id       int unsigned NOT NULL,
    id_album int unsigned NOT NULL,
    title    varchar(255) DEFAULT NULL,
    duration int          DEFAULT NULL,
    PRIMARY KEY (id, id_album),
    CONSTRAINT fk_track_album FOREIGN KEY (id_album) REFERENCES album (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;