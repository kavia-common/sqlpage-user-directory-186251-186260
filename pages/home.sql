-- Home page for SQLPage app
-- Read-only. Uses default datasource defined in sqlpage.yaml.

-- card: a simple welcome card
SELECT
  'card' AS component,
  'Welcome to the User Directory' AS title,
  'Browse the list of users stored in the SQLite database.' AS description;

-- link-list: quick navigation links
SELECT
  'link' AS component,
  'View all users' AS title,
  '/users.sql' AS link;

-- Optional: secondary link back to this page (demonstrates multiple links)
SELECT
  'link' AS component,
  'Home' AS title,
  '/home.sql' AS link;
