const db = require("../../config");

const findAll = () => {
  return db
    .promise()
    .query(
      "SELECT id, firstname, lastname, photo, photoName, role_id, email FROM admin"
    )
    .then((admins) => admins);
};

const findOne = (id) => {
  return db
    .promise()
    .query(
      "SELECT id, firstname, lastname, photo, photoName, role_id, email FROM admin where id = ?",
      [id]
    )
    .then(([admin]) => admin);
};

const findByEmail = (email) => {
  return db
    .promise()
    .query("SELECT * FROM admin where email = ?", [email])
    .then(([admin]) => admin);
};

module.exports = { findAll, findOne, findByEmail };
