import connection from "../database/conection.js";

async function showRecord(req, res){

    try{
        const record = await connection.query(`SELECT 
        MAX("userId") AS "id", 
        "userName" AS "name", 
        COUNT(*) AS "linksCount",  
        SUM(counter) AS "visitCount" 
        FROM links 
        LEFT JOIN users ON links."userId"=users.id 
        GROUP BY "userName" 
        ORDER BY "visitCount" DESC 
        LIMIT 10;`);

        res.status(200).send(record.rows);
    }catch(error) {
        return res.status(500).send(error.message);
      };
};

export { showRecord };