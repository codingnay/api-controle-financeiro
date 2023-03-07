const conn = require('../model/mysql');

const userControl = {

  // Lista todos os registros válidos.
  getAll: async (req, res) => {
    try {
      const [rows] = await conn.query("SELECT * FROM user");
      res.json({ data: rows });
    } catch (error) {
      res.json({ status: "error", message: error });
    }
  },

  // Lista um registro único pelo Id.
  getOne: async (req, res) => {
    try {
      const { id } = req.params;
      const [rows] = await conn.query("SELECT * FROM user WHERE id = ?", [id]);
      res.json({ data: rows });
    } catch (error) {
      res.json({ status: "error", message: error });
    }
  },


  // Insere um novo registro.
  post: async (req, res) => {
    try {
      const { name, email, password, income, address, gender, telephone } = req.body;
      const sql = "INSERT INTO user (name, email, password, income, address, gender, telephone) VALUES (?, ?, ?, ?, ?, ?)";
      const [rows] = await conn.query(sql, [name, email, password, income, address, gender, telephone]);
      res.json({ data: rows });
    } catch (error) {
      res.json({ status: "error", message: error });
    }
  },

  

  // apaga um registro único pelo Id.
  delete: async (req, res) => {
    try {
      const { id } = req.params
      const sql = "UPDATE user SET status = 'del' WHERE id = ?"
      const [rows] = await conn.query(sql, [id]);
      res.json({ data: rows });
    } catch (error) {
      res.json({ status: "error", message: error });
    }

  },

  // Edita o registro pelo Id.
  put: async (req, res) => {
    try {
      const { name, email, password, income, address, gender, telephone } = req.body;
      const { id } = req.params;
      const sql = "UPDATE user SET name = ?, email = ?, password = ?, income = ?, address = ?, gender = ?, telephone = ? WHERE id = ?"
      const [rows] = await conn.query(sql, [name, email, password, income, address, gender, telephone,  id]);
      res.json({ data: rows });
    } catch (error) {
      res.json({ status: "error", message: error });
    }
  }
};

// Exporta o módulo.
module.exports = userControl;

