-- Documentation only: schema outline for the 'users' table used by the SQLPage app.
-- This file is not executed by scripts. The actual database already exists at database/myapp.db.

-- Example schema:
-- CREATE TABLE IF NOT EXISTS users (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     username TEXT UNIQUE NOT NULL,
--     email TEXT UNIQUE NOT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- Example seed data (documentation only):
-- INSERT INTO users (username, email) VALUES ('Alice', 'alice@example.com');
-- INSERT INTO users (username, email) VALUES ('Bob', 'bob@example.com');

-- The SQLPage configuration points to this database via sqlpage.yaml:
-- datasources.default.datasource: ./database/myapp.db
