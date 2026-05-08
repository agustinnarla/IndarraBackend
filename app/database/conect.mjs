import pg from "pg";
import dotenv from "dotenv";

dotenv.config();

const pool = new pg.Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_NAME,
});

pool.on("connect", () => {
  console.log("DataBase coneccted");
});

pool.on("error", (error) => {
  console.log("DataBase error", error);
});

export default pool;
