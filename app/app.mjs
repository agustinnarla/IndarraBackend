import express from "express";
import dotenv from "dotenv";
import router from "./routers/router.mjs";
import cors from "cors";
dotenv.config();

const app = express();

app.use(express.json());
app.use(cors());

app.use("/api/v1", router);

const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(`Server runing for http://localhost:${port}`);
});
