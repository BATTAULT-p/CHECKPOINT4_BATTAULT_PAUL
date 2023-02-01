const express = require("express");

const gameRouter = express.Router();

const gameController = require("../controllers/gameController");

gameRouter.get("/", gameController.getAllGames);
gameRouter.get("/:id", gameController.getGameById);
gameRouter.post("/create", gameController.createGame);
gameRouter.put("/update/:id", gameController.updateGame);
gameRouter.delete("/:id", gameController.deleteGameById);

module.exports = gameRouter;
