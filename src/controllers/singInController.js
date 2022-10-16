import connection from "../database/conection.js";
import bcrypt from "bcrypt";
import { v4 as uuidv4 } from "uuid";
import singInSchema from "../schemas/singInSchema.js"

async function singIn(req, res) {
    const { email, password } = req.body;

    const validation = singInSchema.validate(req.body, {abortEarly: false});
    if (validation.error){
        const erros = validation.error.details
        return res.status(422).send(erros.map((value)=> value.message));
    };

    try {
      const userEmail = await connection.query(`SELECT * FROM users WHERE "userEmail" = $1;`, [email]);
      if(userEmail.rows.length > 0 && bcrypt.compareSync(password, userEmail.rows[0].passWord)){
          const token = uuidv4();
          await connection.query(`INSERT INTO sessions (
            "userId",
            "tolken"
            ) VAlUES ($1, $2)`, [userEmail.rows[0].id, token])
          return res.status(200).send(token);
      }else return res.sendStatus(401);
      
    } catch (error) {
      return res.status(500).send(error.message);
    }
  }
  
  export { singIn };