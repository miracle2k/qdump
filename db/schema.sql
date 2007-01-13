DROP TABLE IF EXISTS items;
CREATE TABLE items (
    id              INT         NOT NULL    auto_increment,
    date_added      datetime    NOT NULL,
    datatype        INT         NOT NULL,    
    data            TEXT        NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS freed_ids;
CREATE TABLE freed_ids (
    id              INT         NOT NULL,
    date_freed      datetime    NOT NULL,
    PRIMARY KEY (id)
);