import pool from "../database/conect.mjs";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";
dotenv.config();

export const login = async (req, res) => {
  try {
    const { dni, password } = req.body;

    if (!dni || !password) {
      return res.status(400).json({
        message: "DNI and password are required plase",
      });
    }

    const result = await pool.query(`SELECT * FROM usuario WHERE dni=$1`, [
      dni,
    ]);

    if (result.rows.length === 0) {
      return res.status(401).json({
        message: "Invalid credentials",
      });
    }

    const passwordValid = await bcrypt.compare(
      password,
      result.rows[0].password,
    );

    const user = result.rows[0];

    const { password: _, ...userWhitoutPassword } = user;

    if (!passwordValid) {
      return res.status(401).json({
        message: "Invalid credentials",
      });
    }

    const token = jwt.sign(
      {
        id: user.id,
        dni: user.dni,
      },
      process.env.JWT_SECRET,
      {
        expiresIn: "1h",
      },
    );
    res.status(200).json({
      message: "Login successful",
      token: token,
      user: userWhitoutPassword,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal server error" });
  }
};
