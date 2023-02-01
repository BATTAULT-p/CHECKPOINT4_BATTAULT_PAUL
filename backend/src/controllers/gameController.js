/* eslint-disable camelcase */
/* eslint-disable consistent-return */

const gameModel = require("../models/gameModel");

const gameController = {
  getAllGames: (req, res, next) => {
    const where = [];

    if (req.query.firm_id != null) {
      where.push(`firm_id = ${req.query.firm_id}`);
    }
    if (req.query.consoles_id != null) {
      where.push(`consoles_id = ${req.query.consoles_id}`);
    }

    gameModel
      .findAll(where)
      .then(([games]) => res.status(200).send(games))
      .catch((err) => next(err));
  },

  getGameById: (req, res, next) => {
    const { id } = req.params;
    gameModel
      .findOne(id)
      .then(([game]) => res.status(200).send(game))
      .catch((err) => next(err));
  },

  createGame: (req, res, next) => {
    const game = req.body;
    gameModel
      .createOne(game)
      .then(() => res.status(200).send("Created"))
      .catch((err) => next(err));
  },

  updateGame: (req, res, next) => {
    const { id } = req.params;

    try {
      gameModel.updateOne(req.body, id).then((result) => {
        if (result.affectedRows === 0) {
          return res.status(400).send("Erreur lors la mise à jour du jeu");
        }
        return res.status(200).send("jeu mis à jour");
      });
    } catch (err) {
      return next(err);
    }
  },

  deleteGameById: (req, res, next) => {
    const { id } = req.params;
    gameModel
      .deleteOne(id)
      .then((response) => {
        if (response.affectedRows !== 1) {
          return res.status(404).send(`game ${id} not found`);
        }
        return res.status(200).send(`game ${id} deleted`);
      })
      .catch((err) => next(err));
  },
};

module.exports = gameController;
