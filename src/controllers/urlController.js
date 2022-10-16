import connection from "../database/conection.js";
import urlSchema from "../schemas/urlSchema.js";
import {nanoid} from "nanoid";

async function shorter(req,res){
    const {authorization} = req.headers;
    const token = authorization?.replace('Bearer ', '');
    const {url} = req.body;
    

    if(!token) {
        return res.sendStatus(401);
    };

    const validation = urlSchema.validate(req.body, {abortEarly: false});
    if (validation.error){
        const erros = validation.error.details
        return res.status(422).send(erros.map((value)=> value.message));
    };

    try {

        const user = await connection.query(`SELECT * FROM sessions 
        JOIN users ON sessions."userId" = users.id 
        WHERE sessions.tolken = $1;
        `, [token]);

        if(user.rows.length< 1){
            return res.sendStatus(401);
        };

        const id = nanoid(8);

        await connection.query(`INSERT INTO links (
            "userId",
            "url",
            "shortUrl"
        )VALUES ($1, $2,$3);`
        ,[user.rows[0].userId, url, id]);


    
        res.status(201).send({
            "shortUrl": id
        });
        
      } catch (error) {
        return res.status(500).send(error.message);
      };
};

async function showUrl(req, res){
    const {id} = req.params;
    try{
        const links = await connection.query(`SELECT * FROM links WHERE id = $1;`, [id]);
        if(!links.rows[0]){
            return res.sendStatus(404);
        };

        const urls = {
            "id": links.rows[0].id,
            "url": links.rows[0].url,
            "shortUrl": links.rows[0].shortUrl
        };
        res.status(200).send({
            ...urls
        }); 

    }catch(error) {
        return res.status(500).send(error.message);
      };
}

async function goUrl(req, res){
    const { shortUrl } = req.params
    try{
        const url = await connection.query(`SELECT * FROM links WHERE "shortUrl" = $1`, [shortUrl]);
        if(!url.rows[0]){
            return res.sendStatus(404); 
        }
        const addOne = url.rows[0].counter +1;
        const link = url.rows[0].url;

        await connection.query(`UPDATE links SET counter = $1 WHERE "shortUrl" = $2;`, [addOne, shortUrl]);
        
        res.redirect(link);
    }catch(error) {
        return res.status(500).send(error.message);
      };
}

export {shorter, showUrl, goUrl};