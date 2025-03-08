BEGIN;

CREATE TABLE artists (
    id          SERIAL PRIMARY KEY,
    user_id     INT UNIQUE NOT NULL,
    style       TEXT,
    created_on  TIMESTAMP DEFAULT NOW()
);

ALTER TABLE artists
ADD CONSTRAINT artists_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);

COMMIT;