-- Users listing page
-- Read-only. Displays id, username, and email from users table.
-- Each row links to /user.sql?id={id}

-- header
SELECT
  'header' AS component,
  'Users' AS title,
  'All users from the SQLite database' AS subtitle;

-- table of users with link on username to details page
SELECT
  'table' AS component,
  'User List' AS title;

-- columns
SELECT
  'columns' AS component,
  3 AS count;

-- column 1: ID
SELECT
  'stat' AS component,
  'ID' AS title,
  CAST(id AS TEXT) AS value
FROM users
ORDER BY id;

-- column 2: Username with link to details
SELECT
  'link' AS component,
  username AS title,
  '/user.sql?id=' || id AS link
FROM users
ORDER BY id;

-- column 3: Email
SELECT
  'text' AS component,
  email AS contents
FROM users
ORDER BY id;

-- back link
SELECT
  'link' AS component,
  'Back to Home' AS title,
  '/home.sql' AS link;
