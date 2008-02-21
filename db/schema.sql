DROP TABLE IF EXISTS items;
CREATE TABLE items (
    id              INTEGER     NOT NULL PRIMARY KEY autoincrement,
    date_added      datetime    NOT NULL,
    remote_ip       VARCHAR(32) NOT NULL,
    data            TEXT        NULL
);

DROP TABLE IF EXISTS freed_ids;
CREATE TABLE freed_ids (
    id              INT         NOT NULL,
    date_freed      datetime    NOT NULL,
    PRIMARY KEY (id)
);
