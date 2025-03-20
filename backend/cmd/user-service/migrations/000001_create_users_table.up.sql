BEGIN;

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY, -- provided externally by Auth Service
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

COMMIT;