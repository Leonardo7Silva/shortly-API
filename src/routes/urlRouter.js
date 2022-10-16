import express from 'express';
import { shorter, showUrl, goUrl, deleteUrl } from "../controllers/urlController.js";

const urlRouter = express.Router();

urlRouter.post("/urls/shorten", shorter);
urlRouter.get("/urls/open/:shortUrl", goUrl);
urlRouter.get("/urls/:id", showUrl);
urlRouter.delete("/urls/:id", deleteUrl);


export default urlRouter; 
