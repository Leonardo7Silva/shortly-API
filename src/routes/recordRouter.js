import express from 'express';
import { showRecord } from '../controllers/recordController.js';

const recordRouter = express.Router();

recordRouter.get("/ranking", showRecord);


export default recordRouter; 