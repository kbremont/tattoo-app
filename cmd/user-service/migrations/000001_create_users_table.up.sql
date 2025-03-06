BEGIN;

CREATE TABLE users (
    id          SERIAL,
    email       TEXT,
    -- password    TEXT,
    first_name  TEXT,
    last_name   TEXT,
    created_on  TIMESTAMP DEFAULT NOW()
);

COMMIT;
