import express from 'express';
import { showMe } from "../controllers/usersControllers.js";

const usersRouter = express.Router();

usersRouter.get("/users/me", showMe);


export default usersRouter; 