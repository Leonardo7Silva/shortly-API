import express from 'express';
import { newUser } from "../controllers/sinUpController.js";

const singUpRouter = express.Router();

singUpRouter.post("/singUp", newUser);

export default singUpRouter;

