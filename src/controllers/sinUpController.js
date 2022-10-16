import connection from "../database/conection.js";
import bcrypt from 'bcrypt';
import singUpSchema from "../schemas/singUpSchema.js";

async function newUser(req, res) {
    const { name, email, password, confirmPassword } = req.body;

    const validation = singUpSchema.validate(req.body, {abortEarly: false});
    if (validation.error){
        const erros = validation.error.details
        return res.status(422).send(erros.map((value)=> value.message));
    };
    if(password !== confirmPassword){
        return res.sendStatus(409);
    }

    try {
        const userEmail = await connection.query('SELECT * FROM users WHERE "userEmail" = $1;',[email]);
        if(userEmail.rows.length > 0 ){
            return res.sendStatus(409);
        };

        const hashingPassword = bcrypt.hashSync(password, 12);
        
        await connection.query(`INSERT INTO users (
            "userName",
            "passWord",
            "userEmail"
        ) VALUES ($1, $2, $3);`
        ,[name, hashingPassword, email]);

    return res.sendStatus(201);
    }catch (error) {
        return res.status(500).send(error.message);
    }
  };

export {
    newUser
};