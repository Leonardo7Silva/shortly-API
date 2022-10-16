
import connection from "../database/conection.js";

async function showMe(req, res){

    const {authorization} = req.headers;
    const token = authorization?.replace('Bearer ', '');

    if(!token) {
        return res.sendStatus(401);
    };

    try{
        const userId = await connection.query(`SELECT users.id, users."userName" 
        FROM sessions 
        JOIN users ON sessions."userId" = users.id 
        WHERE sessions.tolken = $1;`,[token]);

        if(userId.rows.length< 1){
            return res.sendStatus(401);
        };

        const links = await connection.query(`SELECT 
        id, 
        "shortUrl", 
        url, 
        counter AS "visitCount" 
        FROM links WHERE "userId" = $1;`,[userId.rows[0].id]);

        let soma = 0;

        links.rows.map(value=> soma += value.visitCount);
        console.log(soma);

        const retorno = {
            ...userId.rows[0],
            visitCount: soma,
            shortenedUrls: links.rows 
        }
        
        res.status(200).send(retorno); 

    }catch(error) {
        return res.status(500).send(error.message);
      };
}

export { showMe };