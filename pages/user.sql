-- User details page
-- Read-only. Accepts :id as URL parameter, e.g., /user.sql?id=1

-- When user exists, show a card with details
WITH selected_user AS (
  SELECT id, username, email, created_at
  FROM users
  WHERE id = :id
)
SELECT
  'card' AS component,
  'User Details' AS title,
  'Details for the selected user.' AS description
WHERE EXISTS (SELECT 1 FROM selected_user);

-- Show a key-value list for the user when present
WITH selected_user AS (
  SELECT id, username, email, created_at
  FROM users
  WHERE id = :id
)
SELECT
  'key_value' AS component,
  'ID' AS key,
  CAST(id AS TEXT) AS value
FROM selected_user;

WITH selected_user AS (
  SELECT id, username, email, created_at
  FROM users
  WHERE id = :id
)
SELECT
  'key_value' AS component,
  'Username' AS key,
  username AS value
FROM selected_user;

WITH selected_user AS (
  SELECT id, username, email, created_at
  FROM users
  WHERE id = :id
)
SELECT
  'key_value' AS component,
  'Email' AS key,
  email AS value
FROM selected_user;

WITH selected_user AS (
  SELECT id, username, email, created_at
  FROM users
  WHERE id = :id
)
SELECT
  'key_value' AS component,
  'Created At' AS key,
  COALESCE(created_at, '') AS value
FROM selected_user;

-- When user is missing, show a friendly message
SELECT
  'alert' AS component,
  'User not found' AS title,
  'No user exists with the provided ID.' AS description,
  'warning' AS color
WHERE NOT EXISTS (SELECT 1 FROM users WHERE id = :id);

-- Back links
SELECT
  'link' AS component,
  'Back to Users' AS title,
  '/users.sql' AS link;

SELECT
  'link' AS component,
  'Back to Home' AS title,
  '/home.sql' AS link;
