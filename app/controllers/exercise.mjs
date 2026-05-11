import pool from "../database/conect.mjs";

export const updateExercise = async (req, res) => {
  const { id_plan, id_ejercicio } = req.params;
  const { peso } = req.body;

  try {
    if (!id_plan || !id_ejercicio || !peso) {
      return res.status(400).json({
        message: "id_plan, id_ejercicio and peso are required",
      });
    }

    const result = await pool.query(
      `
      UPDATE plan_ejercicio
      SET peso = $1
      WHERE id_plan = $2
      AND id_ejercicio = $3
      `,
      [peso, id_plan, id_ejercicio],
    );

    if (result.rowCount === 0) {
      return res.status(404).json({
        message: "Exercise not found",
      });
    }

    return res.status(200).json({
      message: "Exercise updated successfully",
    });
  } catch (error) {
    console.log(error);

    return res.status(500).json({
      message: "Internal server error",
    });
  }
};
