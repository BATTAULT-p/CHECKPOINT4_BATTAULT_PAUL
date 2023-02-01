/* eslint-disable camelcase */
const db = require("../../config");

const findAll = (where) => {
  const initSql = "SELECT * FROM games";

  if (where.length > 0) {
    return db
      .promise()
      .query(`${initSql} WHERE ${where.join(" AND ")} ORDER BY games.title`)
      .then((games) => games);
  }
  return db
    .promise()
    .query("SELECT * FROM games ORDER BY games.title")
    .then((games) => games);
};

const findOne = (id) => {
  return db
    .promise()
    .query("SELECT * FROM games where id = ?", [id])
    .then(([game]) => game);
};

const createOne = (payload) => {
  return db
    .promise()
    .query("INSERT INTO games SET ?", [payload])
    .then((game) => game);
};

const updateOne = (payload, id) => {
  return db
    .promise()
    .query("UPDATE games SET ? WHERE id = ?", [payload, Number(id)])
    .then(([res]) => res);
};

const deleteOne = (id) => {
  return db
    .promise()
    .query("DELETE FROM games WHERE id = ?", [Number(id)])
    .then(([res]) => res);
};

module.exports = {
  findAll,
  findOne,
  createOne,
  updateOne,
  deleteOne,
};
