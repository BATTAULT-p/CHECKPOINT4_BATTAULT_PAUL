/* eslint-disable camelcase */
/* eslint-disable consistent-return */

const { validationResult } = require("express-validator");
const argon2 = require("argon2");
const userModel = require("../models/userModel");

const userController = {
  getAllUsers: (req, res, next) => {
    userModel
      .findAll()
      .then(([users]) => res.status(200).send(users))
      .catch((err) => next(err));
  },

  getUserById: (req, res, next) => {
    const { id } = req.params;
    userModel
      .findOne(id)
      .then(([user]) => res.status(200).send(user))
      .catch((err) => next(err));
  },

  createUser: async (req, res, next) => {
    const errors = validationResult(req);
    const { role_id, firstname, lastname, email, password } = req.body;
    const hashedPassword = await argon2.hash(password);

    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    try {
      userModel
        .createOne({
          role_id,
          firstname,
          lastname,
          email,
          password: hashedPassword,
        })
        .then(([response]) => {
          console.warn(response);
          return res.status(201).send({
            message: "User created successfully",
            email,
            firstname,
            lastname,
          });
        });
    } catch (err) {
      return next(err);
    }
  },

  login: (req, res, next) => {
    const { email, password } = req.body;
    userModel
      .findByEmail(email)
      .then(async ([user]) => {
        if (!user) {
          res.status(401).send({ message: "Invalid email or password" });
        } else {
          const {
            id,
            role_id,
            email: userEmail,
            firstname,
            lastname,
            password: hashedPassword,
          } = user;

          if (await argon2.verify(hashedPassword, password)) {
            res.status(200).send({
              message: "User logged in successfully",
              id,
              userEmail,
              firstname,
              lastname,
              role_id,
            });
          } else {
            res.status(404).send({ message: "Invalid email or password" });
          }
        }
      })
      .catch((err) => next(err));
  },

  deleteUser: (req, res, next) => {
    const { id } = req.params;
    userModel
      .deleteOne(id)
      .then((response) => {
        if (response.affectedRows !== 1) {
          return res.status(404).send(`user ${id} not found`);
        }
        return res.status(200).send(`user ${id} deleted`);
      })
      .catch((err) => next(err));
  },

  updateUser: async (req, res, next) => {
    const { id } = req.params;

    try {
      userModel.updateOne(req.body, id).then((result) => {
        if (result.affectedRows === 0) {
          return res
            .status(400)
            .send("Erreur lors la mise à jour de l'utilisateur");
        }
        return res.status(200).send("Utilisateur mis à jour");
      });
    } catch (err) {
      return next(err);
    }
  },

  updatePhoto: (req, res, next) => {
    const { id } = req.params;
    const imgSrc = `${process.env.BACKEND_URL}/uploads/photos/${req.file.filename}`;
    userModel
      .updatePhoto(imgSrc, id)
      .then((response) => {
        if (response.affectedRows !== 0) {
          return res.status(200).send("Photo uploaded successfully");
        }
        return res.status(404).send("error uploading image");
      })
      .catch((err) => next(err));
  },
};

module.exports = userController;
