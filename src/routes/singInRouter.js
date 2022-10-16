import express from 'express';
import { singIn } from "../controllers/singInController.js";

const singInRouter = express.Router();

singInRouter.post("/singin", singIn);

export default singInRouter;