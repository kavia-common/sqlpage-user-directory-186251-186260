# sqlpage-user-directory-186251-186260

This workspace includes a minimal SQLPage setup to browse users from the bundled SQLite database.

Added files:
- sqlpage.yaml: SQLPage configuration pointing to ./database/myapp.db and pages folder ./pages
- pages/home.sql: Landing page with quick link to Users
- pages/users.sql: Lists all users (id, username, email) with links to detail pages
- pages/user.sql: Displays details for a given user by id, or a friendly "User not found" alert
- database/schema.sql: Documentation-only schema outline for the users table

## Prerequisites

- Install SQLPage (CLI). Follow the official instructions for your OS: https://sql.ophir.dev/docs/installation
  - After installation, you should have a `sqlpage` command available in your shell.
- Python 3.8+ to run the database initialization script.
- SQLite is bundled with Python’s sqlite3 module; no separate server is required.

## Database Setup (creates and seeds Alice and Bob)

From the workspace root:

1) Change directory into the database folder:
   - cd sqlpage-user-directory-186251-186260/database

2) Initialize the SQLite database (idempotent – safe to run multiple times):
   - python3 init_db.py

What this does:
- Creates myapp.db if it does not exist.
- Ensures tables app_info and users exist.
- Seeds two users if missing:
  - alice (alice@example.com)
  - bob (bob@example.com)
- Writes helper connection info to database/db_connection.txt.
- Generates database/db_visualizer/sqlite.env with SQLITE_DB pointing to the absolute path.

If you need to verify the DB exists:
- ls -l myapp.db
- python3 test_db.py

## Run the SQLPage app

From the workspace root:

1) Ensure the database is initialized as above (database/myapp.db present).

2) Start SQLPage pointing at the configuration file:
   - cd sqlpage-user-directory-186251-186260
   - sqlpage serve sqlpage.yaml

SQLPage will serve the app locally and watch for changes.

## App URLs

Once running, open these pages in your browser:
- Home: /home.sql
- Users list: /users.sql
- User details: /user.sql?id=1 (replace 1 with a valid user id)

If SQLPage prints a base URL like http://localhost:8080, combine it with the path above, e.g.:
- http://localhost:8080/home.sql
- http://localhost:8080/users.sql
- http://localhost:8080/user.sql?id=1

Navigation links are also provided in the pages.

## Troubleshooting

- SQLPage not found:
  - Ensure SQLPage is installed and available on PATH. Reopen your terminal after installation if needed.

- Database path issues:
  - The configured datasource in sqlpage.yaml is relative to the app directory:
    - datasources.default.datasource: ./database/myapp.db
  - Confirm the file exists at: sqlpage-user-directory-186251-186260/database/myapp.db
  - If you moved files, adjust the path in sqlpage.yaml accordingly.

- Users table missing or empty:
  - Rerun the initializer from the database folder:
    - cd sqlpage-user-directory-186251-186260/database
    - python3 init_db.py
  - This will create the users table if needed and seed Alice and Bob if they do not exist.

- Specific user not found on /user.sql?id=…:
  - The page shows a friendly “User not found” alert if no row matches the id.
  - Check existing ids by visiting /users.sql and using those ids on /user.sql?id=<id>.

- Permission or locked database errors:
  - Ensure no other process is writing to myapp.db.
  - Close any SQLite browser that might be locking the file and retry.

## Notes

- All SQL in SQLPage pages is read-only (SELECT only).
- Paths are relative to the app directory; the datasource resolves to ./database/myapp.db.
- The database initialization script is idempotent and safe to re-run at any time.
