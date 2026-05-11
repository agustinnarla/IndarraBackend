import { Router } from "express";
import { login } from "../controllers/auth.mjs";
import { getPlan, getPlanById } from "../controllers/plan.mjs";
import { updateExercise } from "../controllers/exercise.mjs";

const router = Router();

router.post("/login", login);

router.get("/get/plan/:id", getPlan);
router.get("/get/plan/:id/ejercicios", getPlanById);

router.patch("/update/exercise/:id_ejercicio/:id_plan", updateExercise);

export default router;
