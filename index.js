import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import singUpRouter from "./src/routes/singUpRouter.js";
import singInRouter from "./src/routes/singInRouter.js";
import urlRouter from "./src/routes/urlRouter.js";
import usersRouter from "./src/routes/usersRouter.js"

dotenv.config();

const server = express();

server.use(cors());
server.use(express.json());
server.use(singUpRouter);
server.use(singInRouter);
server.use(urlRouter);
server.use(usersRouter);


server.listen(process.env.PORT, ()=>{
    console.log(`Listening on port ${process.env.PORT}`)
});