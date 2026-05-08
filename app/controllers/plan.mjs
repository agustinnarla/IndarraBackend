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
