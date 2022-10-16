import joi from 'joi';

const urlSchema = joi.object({
  url: joi
    .string()
    .uri()
    .empty(" ")
    .min(6)
    .required()
});

export default urlSchema;