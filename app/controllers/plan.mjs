import pool from "../database/conect.mjs";

export const getPlan = async (req, res) => {
  try {
    const { id } = req.params;

    if (!id) {
      return res.status(400).json({
        message: "Not id valid",
      });
    }

    const response = await pool.query(
      `SELECT * FROM plan WHERE id_usuario=$1`,
      [id],
    );

    console.log(response);

    res.status(200).json({
      message: "Se obtudo los planes exitosamente",
      planes: response.rows,
    });
  } catch (error) {
    console.log(error);
  }
};

export const getPlanById = async (req, res) => {
  try {
    const { id } = req.params;

    if (!id) {
      return res.status(400).json({
        message: "Not id valid",
      });
    }
    const response = await pool.query(
      `SELECT pe.id_plan, pe.id_ejercicio, e.detalle, e.id_tipo_ejercicio, te.detalle AS tipo_ejercicio, pe.series, pe.rep, pe.peso
      FROM plan_ejercicio AS pe
      INNER JOIN ejercicio AS e ON pe.id_ejercicio = e.id
      INNER JOIN tipo_ejercicio AS te ON e.id_tipo_ejercicio = te.id
      WHERE pe.id_plan=$1`,
      [id],
    );

    console.log(response.rows);

    res.status(200).json({
      message: "Se obtuvieron los ejercicios exitosamente",
      ejercicios: response.rows,
    });
  } catch (error) {
    console.log(error);
  }
};
