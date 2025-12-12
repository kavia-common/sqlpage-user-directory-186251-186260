# sqlpage-user-directory-186251-186260

This workspace includes a minimal SQLPage setup to browse users from the bundled SQLite database.

Added files:
- sqlpage.yaml: SQLPage configuration pointing to ./database/myapp.db and pages folder ./pages
- pages/home.sql: Landing page with quick link to Users
- pages/users.sql: Lists all users (id, username, email) with links to detail pages
- pages/user.sql: Displays details for a given user by id, or a friendly "User not found" alert
- database/schema.sql: Documentation-only schema outline for the users table

Notes:
- All SQL in SQLPage pages is read-only (SELECT only).
- Paths are relative to the workspace root; the datasource resolves to ./database/myapp.db.
- Further documentation and usage notes will be added in step 3.