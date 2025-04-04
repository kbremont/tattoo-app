BEGIN;

CREATE TYPE user_role AS ENUM (
    'artist',
    'client'
);

CREATE TABLE IF NOT EXISTS users (
    auth0_user_id VARCHAR(255) PRIMARY KEY,
    role user_role NOT NULL DEFAULT 'client',
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

COMMIT;