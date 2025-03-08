BEGIN;

CREATE TABLE IF NOT EXISTS users (
    id          SERIAL PRIMARY KEY,
    email       TEXT,
    -- password    TEXT,
    first_name  TEXT,
    last_name   TEXT,
    created_on  TIMESTAMP DEFAULT NOW()
);

COMMIT;