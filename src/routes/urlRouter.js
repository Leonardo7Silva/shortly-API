import express from 'express';
import { shorter, showUrl, goUrl } from "../controllers/urlController.js";

const urlRouter = express.Router();

urlRouter.post("/urls/shorten", shorter);
urlRouter.get("/urls/open/:shortUrl", goUrl);
urlRouter.get("/urls/:id", showUrl);


export default urlRouter; 
