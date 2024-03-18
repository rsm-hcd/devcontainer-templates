import { Pool } from "https://deno.land/x/postgres@v0.19.3/mod.ts";

Deno.test("database", async () => {
  // Get the connection string from the environment variable "DATABASE_URL"
  const databaseUrl =
    "postgres://postgres:postgres@db:5432/postgres?sslmode=disable";

  // Create a database pool with three connections that are lazily established
  const pool = new Pool(databaseUrl, 3, true);

  // Connect to the database
  const connection = await pool.connect();

  try {
    // Create the table
    await connection.queryObject`
      CREATE TABLE IF NOT EXISTS todos (
        id SERIAL PRIMARY KEY,
        title TEXT NOT NULL
      )
    `;
  } finally {
    // Release the connection back into the pool
    connection.release();
  }

  await pool.end();
});

