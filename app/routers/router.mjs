import { Router } from "express";
import { login } from "../controllers/auth.mjs";
import { getPlan, getPlanById } from "../controllers/plan.mjs";

const router = Router();

router.post("/login", login);

router.get("/get/plan/:id", getPlan);
router.get("/get/plan/:id/ejercicios", getPlanById);
export default router;
