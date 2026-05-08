import { Router } from "express";
import { login } from "../controllers/auth.mjs";
import { getPlan } from "../controllers/plan.mjs";

const router = Router();

router.post("/login", login);

router.get("/get/plan/:id", getPlan);

export default router;
