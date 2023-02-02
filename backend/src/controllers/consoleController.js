/* eslint-disable camelcase */
/* eslint-disable consistent-return */

const consoleModel = require("../models/consoleModel");

const consoleController = {
  getAllConsoles: (req, res, next) => {
    consoleModel
      .findAll()
      .then(([consoles]) => res.status(200).send(consoles))
      .catch((err) => next(err));
  },

  getConsoleById: (req, res, next) => {
    const { id } = req.params;
    consoleModel
      .findOne(id)
      .then(([console]) => res.status(200).send(console))
      .catch((err) => next(err));
  },

  createConsole: (req, res, next) => {
    const console = req.body;
    consoleModel
      .createOne(console)
      .then(() => res.status(200).send("Created"))
      .catch((err) => next(err));
  },

  updateConsole: (req, res, next) => {
    const { id } = req.params;

    try {
      consoleModel.updateOne(req.body, id).then((result) => {
        if (result.affectedRows === 0) {
          return res
            .status(400)
            .send("Erreur lors la mise à jour de la console");
        }
        return res.status(200).send("console mise à jour");
      });
    } catch (err) {
      return next(err);
    }
  },

  deleteConsoleById: (req, res, next) => {
    const { id } = req.params;
    consoleModel
      .deleteOne(id)
      .then((response) => {
        if (response.affectedRows !== 1) {
          return res.status(404).send(`console ${id} not found`);
        }
        return res.status(200).send(`console ${id} deleted`);
      })
      .catch((err) => next(err));
  },
};

module.exports = consoleController;
