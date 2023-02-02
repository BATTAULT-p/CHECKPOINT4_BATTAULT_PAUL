/* eslint-disable camelcase */
const db = require("../../config");

const findAll = () => {
  return db
    .promise()
    .query("SELECT * FROM consoles ORDER BY consoles.title")
    .then((consoles) => consoles);
};

const findOne = (id) => {
  return db
    .promise()
    .query("SELECT * FROM consoles where id = ?", [id])
    .then(([console]) => console);
};

const createOne = (payload) => {
  return db
    .promise()
    .query("INSERT INTO consoles SET ?", [payload])
    .then((console) => console);
};

const updateOne = (payload, id) => {
  return db
    .promise()
    .query("UPDATE consoles SET ? WHERE id = ?", [payload, Number(id)])
    .then(([res]) => res);
};

const deleteOne = (id) => {
  return db
    .promise()
    .query("DELETE FROM consoles WHERE id = ?", [Number(id)])
    .then(([res]) => res);
};

module.exports = {
  findAll,
  findOne,
  createOne,
  updateOne,
  deleteOne,
};
